#!/bin/bash

sudo apt update
sudo apt upgrade -y

#Установка необходимых пакетов

sudo apt install language-pack-ru -y
sudo apt install tree -y
sudo apt install net-tools -y

#Установка и настройка MySQL

#sudo apt install mysql-server -y

cat > .my.cnf
[client]
user=root
password=root

cat .my.cnf

chmod 0600 ~/.my.cnf

#sudo mysql_secure_installation

#sudo mysql






