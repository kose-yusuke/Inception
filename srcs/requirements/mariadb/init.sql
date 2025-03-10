CREATE DATABASE IF NOT EXISTS wpdb;
CREATE USER IF NOT EXISTS 'ykoseki'@'%' IDENTIFIED BY 'Inception';

GRANT ALL PRIVILEGES ON wpdb.* TO 'ykoseki'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'RInception';

CREATE USER IF NOT EXISTS 'ykoseki'@'localhost' IDENTIFIED BY 'Inception';
GRANT ALL PRIVILEGES ON wpdb.* TO 'ykoseki'@'localhost';

FLUSH PRIVILEGES;