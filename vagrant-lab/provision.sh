#!/usr/bin/env bash
echo "Instalando Apache and setting it up..."
yum install -y httpd >/dev/null 2>&1
cp -r /Documentos/cusro devops udemy/html/ * /var/www/html/
service httpd start