# Команды MySQL

## Устанавливаем mysql

Источник:
[https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-8](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-centos-8)

В centos 8 пакет доступен сразу для установки
```
sudo dnf install mysql-server
```

Запускаем mysql сервер
```
systemctl start mysqld
```

Проверяем статус mysql
```
systemctl status mysqld
```

Добавляем mysql в автозапуск
```
systemctl enable mysqld
```

Если нужно удалить mysql с автозагрузки
```
systemctl disable mysqld
```

Выбираем сложность паролей для пользователей mysql. На этом же шаге указываем пароль для root пользователя
```
mysql_secure_installation
```

Заходим в mysql
```
mysql -u root -p
```













