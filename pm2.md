# Команды pm2
Устанавливаем pm2 глобально под root
```
npm install pm2@latest -g
```

Запустить процесс с названием
```
pm2 start app.js --name myapp
```

Говорим pm2 добавить себя в автозапуск
```
pm2 startup systemd -u user —-hp /home/user_folder
```

Проверяем что запущено
```
pm2 ls
```

Сохраняем приложения, которые сейчас в онлайне
```
pm2 save
```

Чтобы запустить одно и тоже приложение на двух разных портах
```
pm2 start --name splitzz_2 app.js -- 3330
```

Показать console.log в коде в реальном времени
```
pm2 log
```
