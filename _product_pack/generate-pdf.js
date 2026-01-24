/**
 * Script para generar product.pdf desde product.html
 * Usa Puppeteer (ya instalado en el proyecto)
 *
 * Uso:
 * node _product_pack/generate-pdf.js
 */

const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

async function generatePDF() {
  console.log('🚀 Iniciando generación de PDF...');

  // Verificar que product.html existe
  const htmlPath = path.join(__dirname, 'product.html');
  if (!fs.existsSync(htmlPath)) {
    console.error('❌ Error: product.html no existe en _product_pack/');
    process.exit(1);
  }

  // Lanzar navegador
  console.log('🌐 Lanzando navegador headless...');
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  try {
    const page = await browser.newPage();

    // Cargar HTML desde file://
    const fileUrl = `file://${htmlPath.replace(/\\/g, '/')}`;
    console.log(`📄 Cargando HTML desde: ${fileUrl}`);

    await page.goto(fileUrl, {
      waitUntil: 'networkidle0'
    });

    // Esperar a que las imágenes carguen
    await page.evaluate(() => {
      return Promise.all(
        Array.from(document.images).map(img => {
          if (img.complete) return Promise.resolve();
          return new Promise((resolve, reject) => {
            img.onload = resolve;
            img.onerror = reject;
          });
        })
      );
    });

    console.log('📸 Generando PDF...');

    // Generar PDF
    const pdfPath = path.join(__dirname, 'product.pdf');
    await page.pdf({
      path: pdfPath,
      format: 'A4',
      printBackground: true,
      margin: {
        top: '20mm',
        right: '15mm',
        bottom: '20mm',
        left: '15mm'
      }
    });

    console.log(`✅ PDF generado exitosamente: ${pdfPath}`);

    // Obtener tamaño del archivo
    const stats = fs.statSync(pdfPath);
    const fileSizeInMB = (stats.size / (1024 * 1024)).toFixed(2);
    console.log(`📦 Tamaño del archivo: ${fileSizeInMB} MB`);

  } catch (error) {
    console.error('❌ Error al generar PDF:', error);
    throw error;
  } finally {
    await browser.close();
    console.log('🔚 Navegador cerrado');
  }
}

// Ejecutar
generatePDF()
  .then(() => {
    console.log('✨ Proceso completado con éxito');
    process.exit(0);
  })
  .catch(error => {
    console.error('💥 Error fatal:', error);
    process.exit(1);
  });
