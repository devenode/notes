# SSL сертификат

## Получение SSL сертификата
Устанавливаем certbot
```
yum -y install certbot
```

Получаем сертификат (в .conf файле должно быть указано well-known директива)
```
certbot certonly --standalone -d example.com -d www.example.com
```

Посмотреть конфигурацию под ssl можна на сайте [mozilla.org](https://ssl-config.mozilla.org/)

В файле конфигурации меняем пути к сертификатам:
```
ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
```

## Команды certbot

Показать сертификаты
```
certbot certificates
```

Удалить сертификат
```
certbot delete --cert-name domain.com
```

Чтобы обновить все сертификаты не выключая сервер
```
certbot renew -a webroot -—webroot-path=/home/user_folder/certs
```

Автоматическое обновление сертификатов
```
cd /etc
vim crontab
```

Добавляем эту строку в файл `crontab`
```
0 */12 * * * root certbot renew -a webroot -—webroot-path=/home/nastromo/certs >> /var/log/ssl.log
```































