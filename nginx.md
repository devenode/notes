# Команды nginx

## Устанавливаем nginx
Устанавливаем epel
```
yum install -y epel-release
```

Устанавливаем nginx 
```
yum -y install nginx
```

Запускаем nginx
```
systemctl start nginx
```

Проверяем статус nginx

```
systemctl status nginx
```

Добавляем nginx в автозапуск CentOS
```
systemctl enable nginx
```

## Пример файл .conf с лоадбалансером
```
upstream infokurs {
    server 127.0.0.1:3000 fail_timeout=0;
    server 127.0.0.1:3030 fail_timeout=0;
}

server {
    listen 80;
    listen [::]:80;
    server_name info-kurs.com www.info-kurs.com;

    # redirect all HTTP requests to HTTPS with a 301 Moved Permanently response.
    return 301 https://info-kurs.com$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name www.info-kurs.com;

    # redirect all HTTP requests to HTTPS with a 301 Moved Permanently response.
    return 301 https://info-kurs.com$request_uri;

    # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
    ssl_certificate /etc/letsencrypt/live/info-kurs.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/info-kurs.com/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:MozSSL:10m;  # about 40000 sessions
    ssl_session_tickets off;

    # curl https://ssl-config.mozilla.org/ffdhe2048.txt > /path/to/dhparam.pem
    # ssl_dhparam /path/to/dhparam.pem;

    # intermediate configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;

    # HSTS (ngx_http_headers_module is required) (63072000 seconds)
    add_header Strict-Transport-Security "max-age=63072000" always;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name info-kurs.com;

    proxy_set_header   X-Forwarded-For    $proxy_add_x_forwarded_for;

    # certs sent to the client in SERVER HELLO are concatenated in ssl_certificate
    ssl_certificate /etc/letsencrypt/live/info-kurs.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/info-kurs.com/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:MozSSL:10m;  # about 40000 sessions
    ssl_session_tickets off;

    # curl https://ssl-config.mozilla.org/ffdhe2048.txt > /path/to/dhparam.pem
    # ssl_dhparam /path/to/dhparam.pem;

    # intermediate configuration
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;

    # HSTS (ngx_http_headers_module is required) (63072000 seconds)
    add_header Strict-Transport-Security "max-age=63072000" always;

    # OCSP stapling
    ssl_stapling on;
    ssl_stapling_verify on;

    # verify chain of trust of OCSP response using Root CA and Intermediate certs
    # ssl_trusted_certificate /path/to/root_CA_cert_plus_intermediates;

    # replace with the IP address of your resolver
    resolver 8.8.8.8;
        
        location ~ /.well-known {
            root /home/nastromo/certs;
            allow all;
        }

	location / {
            proxy_pass "http://infokurs";
        }

        location =/robots.txt {
            root /home/nastromo/prod/storage;
        }

        location =/scatalog/sitemap.xml {
            root /home/nastromo/prod/storage;
        }

        location =/scatalog/news.xml {
            root /home/nastromo/prod/storage;
        }

        error_page 404 /404.html;
            location = /40x.html {
        }

        error_page 500 502 503 504 /50x.html;
            location = /50x.html {
        }
}
```

## Указать дополнительный header
Если нужно указать дополнительный хедер и получить его в коде приложения (указывается в разделе server)
```
proxy_set_header   X-Forwarded-For    $proxy_add_x_forwarded_for;
proxy_set_header   host    $host;

// В коде приложения получаем значения:
const forwarded = req.header[`X-Forwarded-For`];
const hostname = req.header.host;
```

## Получить ssl сертификат невыключая ngnix
```
server {
    listen 80;
    listen [::]:80;
    server_name site.com www.site.com;

    location ~ /.well-known {
        root /home/nastromo/certs;
        allow all;
    }
}
```
