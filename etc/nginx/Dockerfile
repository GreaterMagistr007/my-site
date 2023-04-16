FROM ubuntu/nginx:latest

RUN apt update  -y
RUN apt upgrade -y
RUN apt -y install software-properties-common
RUN add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu focal universe"
RUN apt update  -y
# Некоторые инструменты
RUN apt -y install apt-utils git curl mysql-client libmysqlclient-dev libffi-dev build-essential libssl-dev imagemagick graphicsmagick whois dnsutils libnss3-tools
# Ставим Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

COPY ./conf/errors/* /var/www/html/

USER root

WORKDIR /home/user/services/