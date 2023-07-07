# Команды nodejs

## Установка nodejs на CentOS
Лучший способ для управления node.js это nvm.
Загружаем скрипт, который установит nvm
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
```

Смотрим лист установленых версия node.js
```
nvm list
```

Смотрим лист доступных версий node.js в облаке
```
nvm ls-remote
```

Выбираем версию и устанавливаем
```
nvm install 14.4.1
```

Указываем какую версию использовать
```
nvm use 14.4.1
nvm alias default 14.4.1
```

Проверяем версию node.js
```
node -v
```

Устанавливаем глобально npm менеджер
```
npm install -g npm
```

Проверяем версию npm
```
npm -v
```
