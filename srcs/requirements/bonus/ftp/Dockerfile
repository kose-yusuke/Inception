FROM debian:latest

RUN apt update && apt upgrade -y && apt install -y \
    vsftpd \
    ftp \
    openssl

COPY vsftpd.conf /etc/vsftpd.conf

COPY create_ftp_user.sh /create_ftp_user.sh
RUN chmod +x /create_ftp_user.sh

EXPOSE 21
EXPOSE 21000-21010

CMD ["/bin/bash", "/create_ftp_user.sh"]
