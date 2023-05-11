#!/bin/bash
read -p "Enter your domain name: " DOMAIN_NAME
read -p "Enter your email: " EMAIL
sudo apt-get update
sudo apt-get install snapd
sudo snap install core; sudo snap refresh core
sudo apt-get remove certbot
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot certonly --standalone --non-interactive --agree-tos --email $EMAIL -d $DOMAIN_NAME
mkdir /root/certs
cp /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem /root/certs
cp /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem /root/certs
