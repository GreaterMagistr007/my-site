if [ "$(docker ps -q -f name=project_server)" ]; then
  docker exec -it project_server bash -c "apt install apache2 apache2-utils -y"
  docker exec -it project_server bash -c "cp /home/user/services/etc/ubuntu/apache/apache2.conf /etc/apache2/apache2.conf"
  docker exec -it project_server bash -c "apt install ufw -y"
  docker exec -it project_server bash -c "ufw allow 80"
  docker exec -it project_server bash -c "ufw allow 443"
  docker exec -it project_server bash -c "systemctl restart apache2.service"
else
    echo "Для работы скрипта нужно запустить Docker-контейнер project_server!"
    sleep
fi;
sleep