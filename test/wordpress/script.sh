#!/bin/bash
sleep 10
wp core download --allow-root
wp config create --dbhost=mariadb --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBKEY --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMINKEY --admin_email=$ADMINEMAIL --allow-root
wp user create $USER $USEREMAIL --role=subscriber --user_pass=$USERKEY --allow-root

php-fpm7.4 -F -R --nodaemonize