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
