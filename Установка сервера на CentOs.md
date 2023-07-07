# Установка сервера на CentOs

Заходим на сервер
```
ssh root@111.111.111.111
```

Обновляем систему
```
yum -y update
```

Устанавливаем VIM
```
yum -y install vim
```

Устанавливаем nodejs

[Как установить nodejs?](https://github.com/devenode/notes/blob/main/nodejs.md)

Устанавливаем pm2

[Как установить pm2?](https://github.com/devenode/notes/blob/main/pm2.md)

Создаем дополнительного пользователя
```
adduser nas 
```
[Как подключиться по SSH?](https://github.com/devenode/notes/blob/main/ssh.md)

Архивируем файлы проекта в app.tar.gz архив
```
tar czf js.tar.gz prod/
```

Копируем архив проекта app.tar.gz на сервер в каталог проекта
```
scp app.tar.gz nastromo@165.22.18.107:~/project_dir
```
[Пример файла deploy.sh](https://github.com/devenode/notes/blob/main/deploy.md)

Заходим в каталог с проектом и сохраняем приложение в pm2
```
pm2 start --name app_name app.js
```
[Как добавить pm2 в автозапуск?](https://github.com/devenode/notes/blob/main/pm2.md)

## Настраиваем SE Linux разрешения для работы с nginx, nodejs и статическими файлами

Проверяем статус SE Linux (должно быть enforcing)
```
getenforce
```

Разрешаем nginx работать с nodejs
```
setsebool -P httpd_can_network_connect on
```

Разрешаем http серверу читать файлы из home каталога пользователя
```
setsebool -P httpd_enable_homedirs on
```

Присваиваем файлам в каталоге home/some_user/project_dir тип, который позволит их читать с веба!
```
chcon -Rt httpd_sys_content_t /home/some_user/project_dir
```

## Устанавливаем nginx
[Как установить ngnix?](https://github.com/devenode/notes/blob/main/nginx.md)

Говорим nginx слушать наше nodejs приложение

[Пример .conf файла nginx](https://github.com/devenode/notes/blob/main/nginx.md)

## Подключаем SSL сертификат
[Как получить SSL сертификат?](https://github.com/devenode/notes/blob/main/ssl.md)

## Устанавливаем mysql
[Как установить mysql?](https://github.com/devenode/notes/blob/main/mysql.md)

## Перезагрузка сервера
Перезагружаем сервер сейчас
```
shutdown -r now
```

















