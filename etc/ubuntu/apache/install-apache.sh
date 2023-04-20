apt install apache2 apache2-utils -y
#echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
cp /home/user/services/etc/ubuntu/apache/apache2.conf /etc/apache2/apache2.conf

#apt install ufw -y
#sudo ufw allow 80
#sudo ufw allow 443
#
#sudo systemctl restart apache2.service