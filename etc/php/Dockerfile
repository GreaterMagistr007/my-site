FROM php:8.2

RUN apt-get update && \
apt -y dist-upgrade && \
apt-get install -y wget git unzip curl libpng-dev libcurl3-dev libxml2 libmcrypt-dev libzip-dev zip libxslt-dev rsync imagemagick graphicsmagick

RUN sed -i '/^mozilla\/DST_Root_CA_X3/s/^/!/' /etc/ca-certificates.conf && update-ca-certificates -f

# Расширения
#RUN docker-php-ext-install mysqli pdo pdo_mysql curl dom mbstring intl bcmath gd zip exif sockets

#RUN chmod +x /usr/local/bin/install-php-extensions && sync && install-php-extensions http

## Ставим наш Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
RUN composer config --global process-timeout 3600

RUN usermod -u 1000 www-data

WORKDIR /home/user/services/