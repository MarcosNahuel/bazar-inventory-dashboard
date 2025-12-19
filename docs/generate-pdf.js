const puppeteer = require('puppeteer');
const path = require('path');

async function generatePDF() {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    const htmlPath = path.join(__dirname, 'MANUAL_USUARIO.html');
    await page.goto(`file://${htmlPath}`, { waitUntil: 'networkidle0' });

    await page.pdf({
        path: path.join(__dirname, 'MANUAL_USUARIO.pdf'),
        format: 'A4',
        printBackground: true,
        margin: {
            top: '20mm',
            right: '15mm',
            bottom: '20mm',
            left: '15mm'
        }
    });

    await browser.close();
    console.log('PDF generado: MANUAL_USUARIO.pdf');
}

generatePDF().catch(console.error);
