if [ "$(docker ps -q -f name=project_server)" ]; then
  # Ставим Apache
  docker exec -it project_server bash -c "apt install apache2 apache2-utils -y"
  docker exec -it project_server bash -c "apt install ufw -y"
  docker exec -it project_server bash -c "ufw allow 80"
  docker exec -it project_server bash -c "ufw allow 443"

  # Ставим nginx
  docker exec -it project_server bash -c "apt install nginx -y"
  docker exec -it project_server bash -c "apt install software-properties-common -y"
  docker exec -it project_server bash -c "add-apt-repository ppa:ondrej/php -y"
  docker exec -it project_server bash -c "apt update -y"
  docker exec -it project_server bash -c "apt install php8.2 -y"
  docker exec -it project_server bash -c "apt install libapache2-mod-php8.2 -y"
  docker exec -it project_server bash -c "apt install php8.2-fpm -y"
  docker exec -it project_server bash -c "apt-get install libapache2-mod-proxy-html"
  docker exec -it project_server bash -c "apt-get install php-xml -y"
  docker exec -it project_server bash -c "apt-get install php-curl -y"
  docker exec -it project_server bash -c "a2enmod proxy"
  docker exec -it project_server bash -c "a2enmod proxy_http"

  # копируем конфиги для apache
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/ports.conf /etc/apache2/ports.conf"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/apache2.conf /etc/apache2/apache2.conf"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/sites-available/server.conf /etc/apache2/sites-available/server.conf"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/sites-available/site.conf /etc/apache2/sites-available/site.conf"
  docker exec -it project_server bash -c "a2ensite server.conf"
  docker exec -it project_server bash -c "a2ensite site.conf"

  # копируем конфиги для nginx
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/nginx/sites-available/server.loc /etc/nginx/conf.d/server.conf"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/nginx/sites-available/server.loc /etc/nginx/sites-available/server.loc"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/nginx/sites-available/server.loc /etc/nginx/sites-enabled/server.loc"

  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/php82.ini /etc/php/8.2/cli/php.ini"
  docker exec -it project_server bash -c "a2enmod rewrite"

  # Перезапустим apache и nginx
  docker exec -it project_server bash -c "service nginx restart"
  docker exec -it project_server bash -c "service apache2 restart"

  # Ставим mysql
  docker exec -it project_server bash -c "apt install mysql-server mysql-client -y"
  docker exec -it project_server bash -c "apt-get install php-mysql -y"

  # Ставим Composer
  docker exec -it project_server bash -c "apt install php-cli unzip -y"
  docker exec -it project_server bash -c "curl -sS https://getcomposer.org/installer -o composer-setup.php"
  docker exec -it project_server bash -c "php composer-setup.php --install-dir=/usr/local/bin --filename=composer"
  # Ставим пакеты
  docker exec -it project_server bash -c "cd /home/user/services/server.loc && composer install && composer update"
  # Права на запись
  docker exec -it project_server bash -c "chmod 777 /home/user/services/server.loc/storage -R"
  # Перегенерация ключа
  docker exec -it project_server bash -c "cd /home/user/services/server.loc/ && php artisan key:generate"



  echo "Скрипт успешно отработал и понаставил всякой херни в контейнеры"
  sleep
  pause
else
    echo "Для работы скрипта нужно запустить Docker-контейнер project_server!"
    sleep
    pause
fi;
sleep
pause