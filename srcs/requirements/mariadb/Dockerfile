FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y mariadb-server

# COPY 50-server.cnf /etc/mysql/mariadb/conf.d/.
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql
COPY tools/script.sh /script.sh
# 実行権限を付与（正しいパスに修正）
RUN chmod +x /script.sh
# RUN mkdir /run/mysqld && chmod +x script.sh
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
USER mysql
CMD ["./script.sh"]
