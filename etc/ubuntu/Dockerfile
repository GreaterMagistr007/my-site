FROM ubuntu:22.04

USER root

RUN apt update -y
RUN apt upgrade -y

#Ставим всякие базовые необходимости:
RUN apt install nano -y
RUN apt-get update && apt-get install -y iputils-ping
RUN apt install systemctl -y
RUN apt install sudo -y

#Apache
RUN apt install curl gnupg2 ca-certificates lsb-release -y
RUN apt install apache2 apache2-utils -y
# nginx
#RUN apt install nginx -y
# php
# Добавляем репозиторий для PHP 8.2
#RUN apt install software-properties-common -y
#RUN add-apt-repository ppa:ondrej/php -y
# Обновляем список пакетов и устанавливаем PHP 8.2
#RUN apt update -y
#RUN apt install php8.2 -y
## Устанавливаем необходимые модули PHP для работы с Apache и Nginx
#RUN apt install libapache2-mod-php8.2 -y
#RUN apt install php8.2-fpm -y

##Файрволл
RUN apt install ufw -y
RUN ufw allow 80
RUN ufw allow 443

# Скопируем конфиги
#CMD cp /home/user/services/etc/ubuntu/apache/apache2.conf /etc/apache2/apache2.conf && systemctl restart apache2.service && sh
#CMD add-apt-repository ppa:ondrej/php -y && sh
# Перезапустим apache
#CMD systemctl restart apache2.service && sh