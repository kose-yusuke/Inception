## Inception

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
