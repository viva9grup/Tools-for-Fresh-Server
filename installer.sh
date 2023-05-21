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
