#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# If Configuration File Needs to be Changed
if [ $? -eq 0 ]; then
  # Change the Listening Host with 9000 Port
#   sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf
#   # Append Env Variables on the Configuration File
#   echo "env[MARIADB_DATABASE_HOST] = \$MARIADB_DATABASE_HOST" >> /etc/php/7.3/fpm/pool.d/www.conf
#   echo "env[MARIADB_ADMIN_USER] = \$MARIADB_ADMIN_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
#   echo "env[MARIADB_ADMIN_PASSWORD] = \$MARIADB_ADMIN_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
#   echo "env[MARIADB_DATABASE] = \$MARIADB_DATABASE" >> /etc/php/7.3/fpm/pool.d/www.conf

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
	cp ./conf/wp-config.php /var/www/wordpress/wp-config.php

	sleep 5

	if ! mysqladmin -h $MARIADB_DATABASE_HOST -u $MARIADB_ADMIN_USER --password=$MARIADB_ADMIN_PASSWORD --wait=60 ping > /dev/null; then
		echo -e "${RED} MariaDB daemon is not reachable\n ${RESET}"
		exit 1
  	fi
fi
