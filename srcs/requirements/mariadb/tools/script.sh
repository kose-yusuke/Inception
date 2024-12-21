#!/bin/bash

# (1) データがなければ初期化
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# (2) バックグラウンド起動 (skip-networkingを外す)
mysqld --datadir=/var/lib/mysql --bind-address=0.0.0.0 &
pid="$!"

# (3) 起動待ち (パスワード無し root でOK)
for i in {30..0}; do
    if echo 'SELECT 1' | mysql --protocol=socket -uroot 2>/dev/null; then
        break
    fi
    sleep 1
done

# (4) init.sql 適用 (root無パスでOKだが、ここでrootにパスワード設定されたらこの先はNGになる)
if [ -f "/etc/mysql/init.sql" ]; then
    mysql -uroot < /etc/mysql/init.sql
fi

# (5) 一旦停止＆フォアグラウンド再起動
kill "$pid"
wait "$pid"

exec mysqld --datadir=/var/lib/mysql --bind-address=0.0.0.0
