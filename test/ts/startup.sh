# #!/bin/ash

# mkdir /run/openrc
# touch /run/openrc/softlevel
# openrc
# /etc/init.d/mariadb setup
# rm -rf /var/lib/mysql
# mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# rc-service mariadb stop
# #rc-service mariadb start
# mysqld_safe
# #/usr/bin/mysql_install_db --user=mysql
# #/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
# #/etc/init.d/mariadb setup
# #mariadbd
# #while true; do sleep 1; done;

sed -i "s/\$MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/" /etc/mariadb-init.sql
sed -i "s/\$MYSQL_USER/$MYSQL_USER/" /etc/mariadb-init.sql
sed -i "s/\$MYSQL_PASSWORD/$MYSQL_PASSWORD/" /etc/mariadb-init.sql

cat /etc/mariadb-init.sql > /dev/stderr

exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/etc/mariadb-init.sql


