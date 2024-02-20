#!bin/bash


rm -rf index.html
wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php 
chown -R www-data:www-data /var/www/html/adminer.php 
chmod 755 /var/www/html/adminer.php

cd /var/www/html


php -S 0.0.0.0:800