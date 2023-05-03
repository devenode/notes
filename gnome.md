# Графическая оболочка для сервера CenOS - GNOME

Обновляем CentOS
```
yum -y update
```

Устанавливаем графическую оболочку
```
yum -y groupinstall "GNOME Desktop" "Administration Tools"
```

Запускаем графическую оболочку при старте сервера
```
ln -sf /lib/systemmd/system/runlevel5.target /etc/systemd/system/default.target
```

Перезагрузить сервер
```
init 6
```

Установить EPEL
```
yum -y install epel-release
```

Обновляем систему еще раз
```
yum -y update
```

Почистить кеш
```
yum clean all
```

Устанавливаем XRDP протокол для удаленного доступа
```
yum -y install xrdp tigervnc-server
```

Вносим изменения в SELINUX
```
chcon --type=bin_t /usr/sbin/xrdp
chcon --type=bin_t /usr/sbin/xrdp-sesman
```

Включить фаервол
```
systemctl enable firewalld
```

Запустить фаервол
```
systemctl start firewalld
```

Разрешение для фаервола
```
firewall-cmd --permanent --zone=public --add-port=3389/tcp
```

Перезагрузить фаервол
```
firewall-cmd --reload
```

Запускать XRDP автоматически на запуск сервера
```
systemctl enable xrdp
```

Включить XRDP
```
systemctl start xrdp
```

Проверить статус XRDP
```
netstat -antup | grep xrdp
```
