# SSL сертификат

## Получение SSL сертификата
Устанавливаем certbot
```
yum -y install certbot
```

Получаем сертификат (в .conf фале должно быть указано weel-known директива)
```
certbot certonly --standalone -d example.com -d www.example.com
```

Посмотреть конфигурацию под ssl можна на сайте [mozilla.org](https://ssl-config.mozilla.org/)

В файле конфигурации меняем пути к сертификатам:
```
ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
```

