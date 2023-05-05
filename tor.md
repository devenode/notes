## Установка tor на CentOS
```
yum install epel-release
yum install tor
```

Запуск tor
```
systemctl start tor
```

Добавляем в автозапуск
```
systemctl enable tor
```

## Указываем определенную страну для выхода в инет (MacOS)
Переходим в каталог
```
cd /usr/local/etc/tor
```
Копируем файл torrc (оригинал torrc.sample)
```
cp torrc.sample torrc
```

Добавляем в новом файле строку
```
ExitNodes {ua} StrictNodes 1
```

Если нужно добавть несколько стран для выхода
```
ExitNodes {ua},{ru},{by},{pl},{kz},{ge},{az},{am},{tr},{tm},{bg},{mk},{lt},{lv},{ee},{it},{at},{md},{ro},{hu},{sk},{si},{cz},{gr},{il} StrictNodes 1
```

Запусть или остановить tor на MacOS
```
brew services start tor
brew services stop tor
```

## Новый пароль на порте 9051
Создать пароль
```
tor --hash-password 'somepassword'
```

В содержание файла torrc добавить
```
ControlPort 9051
HashedControlPassword 16:51A7DD6AB787522B601F49CF57F7655AB51779E096F284DE599B26FCFF
```

Перезапустить tor
```
systemctl reload tor
```

## Сменить IP во время работы
Для смены IP понадобится установить NC
```
yum install nc
```

Чтобы сменить IP во время работы использовать команду:
```
(echo authenticate '""'; echo signal newnym; echo quit) | nc localhost 9051
```

Чтобы проверить IP
```
curl --socks5 127.0.0.1:9050 http://checkip.amazonaws.com/
```


















