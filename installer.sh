#!/bin/bash
sudo apt update



# install nginx beautifier
cd /tmp
git clone https://github.com/vasilevich/nginxbeautifier
cp nginxbeautifier/nginxbeautifier.js /usr/bin/ngxbeauty
