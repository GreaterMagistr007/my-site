FROM ubuntu:22.04

USER root

RUN apt update -y
RUN apt upgrade -y

#Ставим всякие базовые необходимости:
RUN apt install nano -y
RUN apt-get update && apt-get install -y iputils-ping
RUN apt install systemctl -y
RUN apt install sudo -y
#CMD sudo su

#Apache
#WORKDIR /home/user/services/etc/ubuntu/apache/
#CMD chmod 777 install-apache.sh
#CMD sudo su
#CMD sudo ./install-apache.sh
##CMD systemctl restart apache2.service



#Apache
RUN apt install apache2 apache2-utils -y
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
#
##Файрволл
RUN apt install ufw -y
RUN ufw allow 80
RUN ufw allow 443

#CMD systemctl restart apache2.service
CMD systemctl restart apache2.service && sh
#CMD sh