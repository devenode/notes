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
