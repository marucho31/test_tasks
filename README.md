# Тестовые задания

## 1 задание - sid.sh
        grep "10.1.192.38" ./log.txt | sed -En 's!^.*sid=/(.*)/&.*$!\1!p' | sort

1. Выбираем строки содержащие нужный ip-адрес
2. Используя регулярное выражение выбираем содежимое после **sid=/** и до **/&** 
3. Сортируем

## 2 задание - app.service

        [Unit]
        Description=Java app service
        StartLimitInterval=30
        StartLimitBurst=3

        [Service]
        Type=simple
        WorkingDirectory=/opt/app
        ExecStart=/usr/bin/java -jar ./app.jar ./output.log "Service is working!"
        Restart=on-failure
        RestartSec=5

        [Install]
        WantedBy=multi-user.target

1. Служба перезапускается при выходе из строя:

        Restart=on-failure

2. Защита от зацикливания перезапусков реализована с помощью:

        StartLimitInterval=30 
        StartLimitBurst=3

    Если приложение перезапустилось **3** раза в течение **30** секунд, оно переходит в **state failed** и systemd не будет пытаться запускать его снова

    [Документация Systemd.unit](https://www.freedesktop.org/software/systemd/man/systemd.unit.html#StartLimitIntervalSec=interval)
    
    >Note that units which are configured for Restart=, and which reach the start limit are not attempted to be restarted anymore; however, they may still be restarted manually or from a timer or socket at a later point, after the interval has passed. From that point on, the restart logic is activated again.