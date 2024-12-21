-- データベースの作成
CREATE DATABASE IF NOT EXISTS wpdb;
-- ユーザーの作成とパスワードの設定
CREATE USER IF NOT EXISTS 'ykoseki'@'%' IDENTIFIED BY 'Inception';

-- 必要な権限を付与
GRANT ALL PRIVILEGES ON wpdb.* TO 'ykoseki'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'RInception';
-- ローカル接続用ユーザーの作成
CREATE USER IF NOT EXISTS 'ykoseki'@'localhost' IDENTIFIED BY 'Inception';
GRANT ALL PRIVILEGES ON wpdb.* TO 'ykoseki'@'localhost';

-- 必要な変更を反映
FLUSH PRIVILEGES;