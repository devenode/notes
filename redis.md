## Установка redis на MacOS
```
brew install redis
```

Запустить redis
```
brew services start redis
```

Проверить пинг (Ответ должен быть PONG)
```
redis-cli ping
```

Добавить redis в автозапуск
```
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
```

## Установка redis на CentOS
Установить репозиторий и обновить yum
```
sudo yum install epel-release
sudo yum update
```

Установить redis
```
sudo yum install redis
```

Запустить redis
```
sudo systemctl start redis
```

Для автоматического запуска redis при старте
```
sudo systemctl enable redis
```

Проверить пинг (Ответ должен быть PONG)
```
redis-cli ping
```














