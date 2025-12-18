/**
 * Cliente de API Mercado Libre
 * Maneja autenticación, rate limiting y operaciones principales
 */

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

  constructor() {
    this.accessToken = process.env.ML_ACCESS_TOKEN || '';
    this.refreshToken = process.env.ML_REFRESH_TOKEN || '';
    this.clientId = process.env.ML_CLIENT_ID || '';
    this.clientSecret = process.env.ML_CLIENT_SECRET || '';
    this.userId = process.env.ML_USER_ID || '';
  }

  private async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
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
      throw new Error('Failed to refresh ML token');
    }

    const data: TokenResponse = await response.json();
    this.accessToken = data.access_token;
    this.refreshToken = data.refresh_token;
    this.expiresAt = Date.now() + (data.expires_in * 1000);

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
        shipping: { logistic_type: string };
        category_id: string;
        date_created: string;
        last_updated: string;
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
  async getAllOrders(daysBack = 30) {
    const allOrders = [];
    let offset = 0;
    const limit = 50;
    let hasMore = true;

    while (hasMore) {
      const result = await this.getOrders(daysBack, limit, offset);
      allOrders.push(...result.results);
      offset += limit;
      hasMore = offset < result.paging.total && offset < 1000; // Limit to 1000 orders
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
