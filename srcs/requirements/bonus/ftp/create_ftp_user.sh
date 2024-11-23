#!/bin/bash

FTP_USER="ftpuser"
FTP_PASS="ftppassword"

useradd -m -s /bin/bash "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd

ln -s /var/www/html /home/$FTP_USER/wordpress
chown -R $FTP_USER:$FTP_USER /var/www/html

/usr/sbin/vsftpd /etc/vsftpd.conf