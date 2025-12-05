#!/bin/bash

yum update -y
yum install -y git nginx

systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/*
git clone https://github.com/Prathmesh9921/Static-Website-Deployment-Using-Terraform.git /usr/share/nginx/html

chown -R nginx:nginx /usr/share/nginx/html
chmod -R 755 /usr/share/nginx/html
