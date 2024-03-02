#!/bin/bash

sed -i -e 's/.*listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root
wp config create --dbhost=$DBHOST --dbname=$DBNAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
wp core install --url=localhost --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINKEY --admin_email=$ADMINEMAIL --skip-email --allow-root
wp user create $USER $USEREMAIL --role='subscriber' --user_pass=$USERKEY --nickname=$USERNICKNAME --allow-root

# wp plugin install redis-cache --activate --allow-root

chown -R www-data:www-data /var/www/html/

until [ -f ./redis.enabled.bck ] 
do
    sleep 1 
done

sleep 3

wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

exec php-fpm7.4 -F

# Source for cli commands
#https://developer.wordpress.org/cli/commands/