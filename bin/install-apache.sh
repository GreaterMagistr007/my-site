if [ "$(docker ps -q -f name=project_server)" ]; then
  docker exec -it project_server bash -c "apt install apache2 apache2-utils -y"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/apache2.conf /etc/apache2/apache2.conf"
  docker exec -it project_server bash -c "apt install ufw -y"
  docker exec -it project_server bash -c "ufw allow 80"
  docker exec -it project_server bash -c "ufw allow 443"

  docker exec -it project_server bash -c "apt install nginx -y"
  docker exec -it project_server bash -c "apt install software-properties-common -y"
  docker exec -it project_server bash -c "add-apt-repository ppa:ondrej/php -y"
  docker exec -it project_server bash -c "apt update -y"
  docker exec -it project_server bash -c "apt install php8.2 -y"
  docker exec -it project_server bash -c "apt install libapache2-mod-php8.2 -y"
  docker exec -it project_server bash -c "apt install php8.2-fpm -y"

  docker exec -it project_server bash -c "systemctl restart apache2.service"
  echo "Скрипт успешно отработал и понаставил всякой херни в контейнеры"
else
    echo "Для работы скрипта нужно запустить Docker-контейнер project_server!"
    sleep
fi;
sleep
pause