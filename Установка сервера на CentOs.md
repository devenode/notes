# Установка сервера на CentOs

1. Заходим на сервер
```
ssh root@111.111.111.111
```

2. Обновляем систему
```
yum -y update
```

3. Устанавливаем VIM
```
yum -y install vim
```

4. Устанавливаем node.js

[Как установить node.js на CentOs](https://github.com/devenode/notes/blob/main/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0%20nodejs.md)

5. Создаем дополнительного пользователя
```
adduser nas 
```
[Как подключиться по SSH?](https://github.com/devenode/notes/blob/main/%D0%9F%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B0%D0%B5%D0%BC%D1%81%D1%8F%20%D0%BF%D0%BE%20SSH.md)

6. Архивируем файлы проекта в app.tar.gz архив
```
tar czf js.tar.gz prod/
```

7. Копируем архив проекта app.tar.gz на сервер в каталог проекта
```
scp app.tar.gz nastromo@165.22.18.107:~/project_dir
```
[Пример файла deploy.sh](https://github.com/devenode/notes/blob/main/%D0%9F%D1%80%D0%B8%D0%BC%D0%B5%D1%80%20%D1%84%D0%B0%D0%B9%D0%BB%D0%B0%20deploy.sh.md)

8. Заходим в каталон с проектом и сохраняем приложение в pm2
```
pm2 start --name app_name app.js
```
[Как добавить pm2 в автозапуск](https://github.com/devenode/notes/blob/main/PM2%20%D0%BC%D0%B5%D0%BD%D0%B5%D0%B4%D0%B6%D0%B5%D1%80.md)





