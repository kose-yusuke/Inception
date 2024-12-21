FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y php-fpm \
    php-mysqli \
    curl \
    mariadb-client

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY tools/script.sh .
RUN chmod +x /script.sh
RUN mkdir -p /run/secrets
CMD ["./script.sh"]
