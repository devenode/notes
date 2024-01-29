# Проблемы с русской кириллицей при кодировке utf8
```
cheerio.load(body, { decodeEntities: false });
```

# Проблемы с украинской charset=windows-1251
Нужно установить либу `iconv-lite`
```
const body = iconv.encode(iconv.decode(new Buffer(html, `binary`), `win1251`), `utf8`);
cheerio.load(body, { decodeEntities: false });
```
# Простое решение через he модуль
```
const cheerio = require('cheerio')
const he = require('he')

const htmlString = '<a href="/kontakti">&#x41a;&#x43e;&#x43d;&#x442;&#x430;&#x43a;&#x442;&#x438;</a>'
const $ = cheerio.load(htmlString)
const decodedText = he.decode($('a').text())
console.log(decodedText)
```
