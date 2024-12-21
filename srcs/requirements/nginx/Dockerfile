FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y nginx

RUN mkdir -p /etc/nginx/ssl
COPY ./crt.pem /etc/nginx/ssl/crt.pem
COPY ./privkey.pem /etc/nginx/ssl/privkey.pem
COPY ./passwd.txt /etc/nginx/ssl/passwd.txt
COPY conf/default /etc/nginx/sites-available/default
RUN rm -f /etc/nginx/sites-enabled/default && ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
