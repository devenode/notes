# Примеры кода puppeteer

## Запуск puppeteer на CentOS
Чтобы запустить puppeteer на CentOs нужно установить зависимости:
```
yum install pango.x86_64 libXcomposite.x86_64 libXcursor.x86_64 libXdamage.x86_64 libXext.x86_64 libXi.x86_64 libXtst.x86_64 cups-libs.x86_64 libXScrnSaver.x86_64 libXrandr.x86_64 GConf2.x86_64 alsa-lib.x86_64 atk.x86_64 gtk3.x86_64 -y
```

Дополнительно установить шрифты
```
yum install ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc -y
```

Выполнить команду
```
yum update nss -y
```

В js коде должно быть прописано
```
const browser = await puppeteer.launch({ args: ['--no-sandbox']})
```
