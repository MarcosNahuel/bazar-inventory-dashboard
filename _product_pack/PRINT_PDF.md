# Generar product.pdf desde product.html

## Opción 1: Con Puppeteer (Automático)

### Instalar Chrome para Puppeteer
```bash
npx puppeteer browsers install chrome
```

### Ejecutar Script
```bash
cd _product_pack
node generate-pdf.js
```

---

## Opción 2: Desde el Navegador (Manual - Recomendado)

### Pasos:
1. Abrir `_product_pack/product.html` en Chrome/Edge:
   - Doble click en el archivo
   - O desde terminal: `start _product_pack/product.html` (Windows)

2. Imprimir a PDF:
   - **Ctrl + P** (o Cmd + P en Mac)
   - Destino: "Guardar como PDF"
   - Diseño: **Vertical**
   - Márgenes: **Predeterminados**
   - ✅ **Gráficos de fondo**: ACTIVADO (importante)
   - Escala: **100%**

3. Guardar:
   - Nombre: `product.pdf`
   - Ubicación: `_product_pack/product.pdf`

**Resultado esperado:** PDF de ~15-20 páginas con todas las imágenes y estilos.

---

## Opción 3: Con wkhtmltopdf (Alternativa)

```bash
# Instalar (si no está instalado)
choco install wkhtmltopdf  # Windows
brew install wkhtmltopdf   # Mac
apt-get install wkhtmltopdf # Linux

# Generar PDF
cd _product_pack
wkhtmltopdf --enable-local-file-access product.html product.pdf
```

---

## Verificación

El PDF debe contener:
- ✅ Header con título y subtítulo
- ✅ Elevator pitch con gradiente
- ✅ 6 métricas en tarjetas
- ✅ 4 módulos principales
- ✅ 6 screenshots de UI
- ✅ Stack técnico y tabla de features
- ✅ Sección de riesgos y roadmap
- ✅ Footer con contacto

**Tamaño esperado:** 2-5 MB (depende de la compresión de imágenes)
