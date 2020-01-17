const path = require('path');
const puppeteer = require('puppeteer');
const url = `file:${path.join(__dirname, 'darge.html')}`;

(async function(){
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    const response = await page.goto(url);
    const element = await page.$('svg');
    await element.screenshot({path: 'screenshot.png'});
    await browser.close();
})();
