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
## Как сменить root пароль

Остановить сервер mysql:
```
sudo /usr/local/mysql/support-files/mysql.server stop
```

Запустить сервер и сбросить авторизацию:
```
sudo /usr/local/mysql/support-files/mysql.server start --skip-grant-tables
```

Запустить mysql клиент
```
/usr/local/mysql/bin/mysql
```

Сбросить привелегии
```
FLUSH PRIVILEGES;
```

Назначить новый хост для юзера:
```
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';
```

Назначить новый пароль для юзера:
```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';
```

Закрыть клиент:
```
exit
```

Остановить сервер:
```
sudo /usr/local/mysql/support-files/mysql.server stop
```

Запустить сервер:
```
sudo /usr/local/mysql/support-files/mysql.server start
```

Готово! Можно входить под новым юзером.

## Часто используемые команды
Создать БД
```
CREATE SCHEMA `new_DB`;
```

Предоставить все права пользователю
```
GRANT ALL ON new_DB.* TO 'admin'@'localhost';
```

Посмотреть права у пользователя:
```
SHOW GRANTS FOR 'admin'@'%';
```










