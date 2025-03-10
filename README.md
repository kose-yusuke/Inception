## Inception
Nginx, Mariadb, WordpressをDockerで構築してWordpressサイトを表示する.

## Usage
(初回のみ)
make swarm
make secret
(通常時)
make

## Wordpressの所在
https://localhost
https://127.0.0.1
https://ykoseki.42.fr

## Wordpress login
/wp-login.php

## 
docker network inspect srcs_inception

## wp-user
make wordpress
/var/www/html/wp-cli.phar user list --allow-root --path=/var/www/html

## db見る
mysql -uroot -p
/secret/db_root_password
> SHOW DATABASES;
例えばwpdbの中身みたい →　TABLEみたい
USE wpdb; →　SHOW TABLES;

## Local →　VM
scp -r -P 4242 /home/ykoseki/Documents/rev_renshu ykoseki@127.0.0.1:/home/ykoseki

## VM → Local
scp -r -P 4242 ykoseki@127.0.0.1:/home/ykoseki /home/ykoseki

## Ubuntu 隠しファイル
Ctrl + h

## Adminer
http://localhost:8080/

## Macなので, volumeは以下
/Users/koseki.yusuke/ykoseki/data

## 要件
- NGINX（TLSv1.2またはTLSv1.3のみ）を含むDockerコンテナ 
- nginxを含まないWordPress + php-fpm（インストールと設定が必要）のみを含むDockerコンテナ 
- nginxを含まないMariaDBのみを含むDockerコンテナ 
- WordPressデータベースを含むボリューム 
- WordPressウェブサイトのファイルを含む2つ目のボリューム 
- コンテナ間の接続を確立するdocker-network
- コンテナはクラッシュした場合に再起動する必要がある
- docker-compose.ymlファイルにnetwork行がなければならない
- 管理者のユーザー名にadmin/Adminやadministrator/Administratorを含めることはできない（例：admin、administrator、Administrator、admin-123など）

## Bonus
- 追加サービスごとにDockerfileを記述する必要がある
- WordPressウェブサイトのキャッシュを適切に管理するために、redisキャッシュをセットアップする
- WordPressウェブサイトのボリュームを指すFTPサーバー・コンテナをセットアップする
- PHP以外の好みの言語で、シンプルな静的ウェブサイトを作成する
- 例えば、ショーケースのサイトや履歴書を紹介するサイトなど
- Set up Adminer
