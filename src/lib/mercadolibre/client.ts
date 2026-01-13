/**
 * Cliente de API Mercado Libre
 * Maneja autenticación, rate limiting y operaciones principales
 * Los tokens se persisten automáticamente en Supabase
 */

import { getStoredTokens, saveTokens, isTokenExpiringSoon } from './token-store';

const ML_API_BASE = 'https://api.mercadolibre.com';

interface TokenResponse {
  access_token: string;
  refresh_token: string;
  expires_in: number;
  token_type: string;
}

class MercadoLibreClient {
  private accessToken: string;
  private refreshToken: string;
  private clientId: string;
  private clientSecret: string;
  private userId: string;
  private expiresAt: number = 0;
  private initialized: boolean = false;
  private initPromise: Promise<void> | null = null;

  constructor() {
    // Inicializar con valores de env vars como fallback
    this.accessToken = process.env.ML_ACCESS_TOKEN || '';
    this.refreshToken = process.env.ML_REFRESH_TOKEN || '';
    this.clientId = process.env.ML_CLIENT_ID || '';
    this.clientSecret = process.env.ML_CLIENT_SECRET || '';
    this.userId = process.env.ML_USER_ID || '';
  }

  // Inicializar tokens desde Supabase (si están disponibles)
  private async ensureInitialized(): Promise<void> {
    if (this.initialized) return;

    // Evitar múltiples inicializaciones concurrentes
    if (this.initPromise) {
      await this.initPromise;
      return;
    }

    this.initPromise = this.loadTokensFromStore();
    await this.initPromise;
    this.initialized = true;
  }

  private async loadTokensFromStore(): Promise<void> {
    try {
      const stored = await getStoredTokens();

      if (stored) {
        this.accessToken = stored.access_token;
        this.refreshToken = stored.refresh_token;
        this.expiresAt = new Date(stored.expires_at).getTime();

        // Si el token está por expirar, refrescarlo proactivamente
        if (isTokenExpiringSoon(stored.expires_at, 30)) {
          console.log('[ML Client] Token expiring soon, refreshing proactively...');
          await this.refreshAccessToken();
        }
      } else {
        console.log('[ML Client] No stored tokens, using env vars');
      }
    } catch (e) {
      console.error('[ML Client] Error loading tokens from store:', e);
    }
  }

  private async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
    // Asegurar que los tokens están inicializados desde Supabase
    await this.ensureInitialized();

    const url = `${ML_API_BASE}${endpoint}`;

    const response = await fetch(url, {
      ...options,
      headers: {
        'Authorization': `Bearer ${this.accessToken}`,
        'Content-Type': 'application/json',
        ...options.headers,
      },
    });

    if (response.status === 401) {
      // Token expirado, renovar
      await this.refreshAccessToken();
      return this.request<T>(endpoint, options);
    }

    if (!response.ok) {
      const error = await response.json().catch(() => ({}));
      throw new Error(`ML API Error ${response.status}: ${JSON.stringify(error)}`);
    }

    return response.json();
  }

  async refreshAccessToken(): Promise<TokenResponse> {
    console.log('[ML Client] Refreshing access token...');

    const params = new URLSearchParams({
      grant_type: 'refresh_token',
      client_id: this.clientId,
      client_secret: this.clientSecret,
      refresh_token: this.refreshToken,
    });

    const response = await fetch(`${ML_API_BASE}/oauth/token`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: params.toString(),
    });

    if (!response.ok) {
      const errorBody = await response.text().catch(() => 'Unknown error');
      console.error('[ML Client] Token refresh failed:', response.status, errorBody);
      throw new Error('Failed to refresh ML token');
    }

    const data: TokenResponse = await response.json();
    this.accessToken = data.access_token;
    this.refreshToken = data.refresh_token;
    this.expiresAt = Date.now() + (data.expires_in * 1000);

    // Guardar tokens actualizados en Supabase
    const saved = await saveTokens(data.access_token, data.refresh_token, data.expires_in);
    if (saved) {
      console.log('[ML Client] New tokens saved to Supabase');
    } else {
      console.log('[ML Client] Could not save tokens to Supabase (will use env vars as fallback)');
    }

    return data;
  }

  // Obtener información del usuario
  async getUser() {
    return this.request<{
      id: number;
      nickname: string;
      site_id: string;
      status: { site_status: string };
    }>(`/users/${this.userId}`);
  }

  // Obtener IDs de productos
  async getProductIds(status?: 'active' | 'paused' | 'closed', limit = 50, offset = 0) {
    const statusParam = status ? `&status=${status}` : '';
    return this.request<{
      results: string[];
      paging: { total: number; offset: number; limit: number };
    }>(`/users/${this.userId}/items/search?limit=${limit}&offset=${offset}${statusParam}`);
  }

  // Obtener detalles de múltiples productos
  async getProductsDetails(ids: string[]) {
    const idsParam = ids.join(',');
    return this.request<Array<{
      code: number;
      body: {
        id: string;
        title: string;
        seller_custom_field: string | null;
        price: number;
        currency_id: string;
        available_quantity: number;
        status: string;
        permalink: string;
        thumbnail: string;
        shipping: {
          logistic_type: string;
          free_shipping: boolean;
        };
        category_id: string;
        date_created: string;
        last_updated: string;
        // Campos adicionales para detección
        tags: string[];
        channels: string[];
        listing_type_id: string;
        catalog_listing: boolean;
        catalog_product_id: string | null;
        // Para stock separado FULL/FLEX - puede estar en variations
        user_product_id?: string;
        variations?: Array<{
          id: number;
          user_product_id?: string;
          available_quantity: number;
          seller_custom_field: string | null;
        }>;
      };
    }>>(`/items?ids=${idsParam}`);
  }

  // Obtener stock por ubicación
  async getStock(itemId: string) {
    try {
      return await this.request<{
        locations: Array<{
          type: string;
          available_quantity: number;
        }>;
      }>(`/user-products/${itemId}/stock`);
    } catch {
      // Fallback: usar available_quantity del item
      return null;
    }
  }

  // Obtener información de envío
  // Según doc ML: logistic.type puede ser: drop_off, fulfillment, cross_docking, self_service, xd_drop_off
  async getShipment(shipmentId: number) {
    try {
      const response = await this.request<{
        id: number;
        status: string;
        logistic: {
          mode: string;
          type: string;  // drop_off, fulfillment, cross_docking, etc.
          direction: string;
        };
        tracking_number: string | null;
      }>(`/shipments/${shipmentId}`, {
        headers: {
          'x-format-new': 'true'  // Requerido por ML para nuevo formato
        }
      });
      return response;
    } catch {
      return null;
    }
  }

  // Obtener stock separado por ubicación (FULL vs FLEX)
  // Requiere user_product_id, no item_id
  async getUserProductStock(userProductId: string) {
    try {
      const response = await this.request<{
        locations: Array<{
          type: string;  // meli_facility (FULL) o selling_address (FLEX)
          quantity: number;
        }>;
        id: string;
        user_id: number;
      }>(`/user-products/${userProductId}/stock`);

      // Extraer stock por tipo
      const stockByType = {
        meli_facility: 0,    // FULL
        selling_address: 0,  // FLEX
        total: 0
      };

      for (const loc of response.locations || []) {
        if (loc.type === 'meli_facility') {
          stockByType.meli_facility = loc.quantity;
        } else if (loc.type === 'selling_address') {
          stockByType.selling_address = loc.quantity;
        }
        stockByType.total += loc.quantity;
      }

      return stockByType;
    } catch {
      return null;
    }
  }

  // Obtener órdenes
  async getOrders(daysBack = 30, limit = 50, offset = 0) {
    const dateFrom = new Date(Date.now() - daysBack * 24 * 60 * 60 * 1000)
      .toISOString()
      .split('.')[0] + '.000-00:00';

    return this.request<{
      results: Array<{
        id: number;
        status: string;
        date_created: string;
        date_closed: string;
        total_amount: number;
        currency_id: string;
        buyer: { id: number; nickname: string };
        order_items: Array<{
          item: { id: string; title: string; seller_sku: string | null };
          quantity: number;
          unit_price: number;
        }>;
        shipping: { id: number; status: string };
      }>;
      paging: { total: number; offset: number; limit: number };
    }>(`/orders/search?seller=${this.userId}&order.date_created.from=${dateFrom}&limit=${limit}&offset=${offset}&sort=date_desc`);
  }

  // Obtener todas las órdenes de los últimos N días
  async getAllOrders(daysBack = 30, maxOrders = 10000) {
    const allOrders = [];
    let offset = 0;
    const limit = 50;
    let hasMore = true;

    while (hasMore && allOrders.length < maxOrders) {
      const result = await this.getOrders(daysBack, limit, offset);
      allOrders.push(...result.results);
      offset += limit;
      hasMore = offset < result.paging.total;

      // Rate limiting
      if (hasMore && allOrders.length < maxOrders) {
        await new Promise(resolve => setTimeout(resolve, 50));
      }
    }

    return allOrders;
  }

  // Obtener todos los productos con detalles
  async getAllProducts(status?: 'active' | 'paused' | 'closed') {
    const allProducts = [];
    let offset = 0;
    const limit = 50;
    let hasMore = true;

    while (hasMore) {
      const result = await this.getProductIds(status, limit, offset);

      // Obtener detalles en batches de 20
      for (let i = 0; i < result.results.length; i += 20) {
        const batch = result.results.slice(i, i + 20);
        const details = await this.getProductsDetails(batch);
        allProducts.push(...details.filter(d => d.code === 200).map(d => d.body));

        // Rate limiting
        await new Promise(resolve => setTimeout(resolve, 100));
      }

      offset += limit;
      hasMore = offset < result.paging.total;
    }

    return allProducts;
  }

  // Calcular ventas por SKU en un período
  async getSalesBySku(daysBack = 30) {
    const orders = await this.getAllOrders(daysBack);
    const salesBySku: Record<string, { quantity: number; amount: number }> = {};

    for (const order of orders) {
      if (order.status !== 'cancelled') {
        for (const item of order.order_items) {
          const sku = item.item.seller_sku || item.item.id;
          if (!salesBySku[sku]) {
            salesBySku[sku] = { quantity: 0, amount: 0 };
          }
          salesBySku[sku].quantity += item.quantity;
          salesBySku[sku].amount += item.quantity * item.unit_price;
        }
      }
    }

    return salesBySku;
  }

  // Obtener órdenes por rango de fechas
  async getOrdersByDateRange(dateFrom: Date, dateTo: Date, limit = 50, offset = 0) {
    const fromStr = dateFrom.toISOString().split('.')[0] + '.000-00:00';
    const toStr = dateTo.toISOString().split('.')[0] + '.000-00:00';

    return this.request<{
      results: Array<{
        id: number;
        status: string;
        date_created: string;
        date_closed: string;
        total_amount: number;
        currency_id: string;
        buyer: { id: number; nickname: string };
        order_items: Array<{
          item: { id: string; title: string; seller_sku: string | null };
          quantity: number;
          unit_price: number;
        }>;
        shipping: { id: number; status: string };
      }>;
      paging: { total: number; offset: number; limit: number };
    }>(`/orders/search?seller=${this.userId}&order.date_created.from=${fromStr}&order.date_created.to=${toStr}&limit=${limit}&offset=${offset}&sort=date_asc`);
  }

  // Obtener todas las órdenes en un rango de fechas (paginado completo)
  async getAllOrdersByDateRange(dateFrom: Date, dateTo: Date, maxOrders = 10000) {
    const allOrders = [];
    let offset = 0;
    const limit = 50;
    let hasMore = true;

    while (hasMore && allOrders.length < maxOrders) {
      const result = await this.getOrdersByDateRange(dateFrom, dateTo, limit, offset);
      allOrders.push(...result.results);
      offset += limit;
      hasMore = offset < result.paging.total;

      // Rate limiting
      await new Promise(resolve => setTimeout(resolve, 100));
    }

    return allOrders;
  }

  // Obtener serie temporal de ventas mensuales
  async getMonthlySalesSeries(months = 24) {
    const series: Array<{
      month: string;
      year: number;
      month_num: number;
      orders_count: number;
      units_sold: number;
      revenue: number;
      avg_ticket: number;
    }> = [];

    const now = new Date();

    // Iterar mes por mes hacia atrás
    for (let i = 0; i < months; i++) {
      const targetDate = new Date(now.getFullYear(), now.getMonth() - i, 1);
      const nextMonth = new Date(now.getFullYear(), now.getMonth() - i + 1, 1);

      const monthNames = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'];
      const monthKey = `${monthNames[targetDate.getMonth()]} ${targetDate.getFullYear()}`;

      try {
        const orders = await this.getAllOrdersByDateRange(targetDate, nextMonth, 5000);

        let totalUnits = 0;
        let totalRevenue = 0;
        let validOrders = 0;

        for (const order of orders) {
          if (order.status !== 'cancelled') {
            validOrders++;
            for (const item of order.order_items) {
              totalUnits += item.quantity;
              totalRevenue += item.quantity * item.unit_price;
            }
          }
        }

        series.unshift({
          month: monthKey,
          year: targetDate.getFullYear(),
          month_num: targetDate.getMonth() + 1,
          orders_count: validOrders,
          units_sold: totalUnits,
          revenue: Math.round(totalRevenue),
          avg_ticket: validOrders > 0 ? Math.round(totalRevenue / validOrders) : 0
        });
      } catch (error) {
        console.error(`Error fetching month ${monthKey}:`, error);
        series.unshift({
          month: monthKey,
          year: targetDate.getFullYear(),
          month_num: targetDate.getMonth() + 1,
          orders_count: 0,
          units_sold: 0,
          revenue: 0,
          avg_ticket: 0
        });
      }

      // Rate limiting entre meses
      await new Promise(resolve => setTimeout(resolve, 200));
    }

    return series;
  }

  // Obtener tokens actuales
  getTokens() {
    return {
      access_token: this.accessToken,
      refresh_token: this.refreshToken,
      expires_at: this.expiresAt,
    };
  }

  // Actualizar tokens manualmente
  setTokens(accessToken: string, refreshToken: string) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }
}

// Singleton instance
let mlClient: MercadoLibreClient | null = null;

export function getMercadoLibreClient(): MercadoLibreClient {
  if (!mlClient) {
    mlClient = new MercadoLibreClient();
  }
  return mlClient;
}

export { MercadoLibreClient };
