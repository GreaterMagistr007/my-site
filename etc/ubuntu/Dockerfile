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

##Файрволл
RUN apt install ufw -y
RUN ufw allow 80
RUN ufw allow 443