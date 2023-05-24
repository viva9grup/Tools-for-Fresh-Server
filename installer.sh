#!/bin/bash
sudo apt update


# install npm nodejs composer
apt install npm -y
npm install -g n
n lts
apt install composer -y

# install nginx beautifier
cd /tmp
git clone https://github.com/vasilevich/nginxbeautifier
cp nginxbeautifier/nginxbeautifier.js /usr/bin/ngxbeauty


# add user pass & database
cd /tmp
wget https://gist.githubusercontent.com/viva9grup/a3b8caceb76615a93bbae078b3a5d944/raw/c9bc608cc854ee5e498f495f8422e917e3883450/add_mysql_user.sh
UserName=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
PassWord=$(cat /dev/urandom | tr -cd '[:graph:]' | fold -w 24 | head -n 1)
DataBase=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8 ; echo '')
