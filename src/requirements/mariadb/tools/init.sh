#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

service mysql start

#Check if the database exists

if [ -d "/var/lib/mysql/$MARIADB_DATABASE" ]
then
	echo -e "${RED} Database [$MARIADB_DATABASE] already exists ${RESET}"
else
	# # Create root user
	# echo -e "${GREEN} GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; FLUSH PRIVILEGES; ${RESET}"
	# echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u$MARIADB_USER -p$MARIADB_PASSWORD

	# Create database and grant all on admin user
	echo -e "${GREEN} CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_ADMIN_USER'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD'; FLUSH PRIVILEGES; ${RESET}"
	echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE; GRANT ALL ON $MARIADB_DATABASE.* TO '$MARIADB_ADMIN_USER'@'%' IDENTIFIED BY '$MARIADB_ADMIN_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PASSWORD

	# Create normal user
	echo -e "${GREEN} CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'; ${RESET}"
	echo "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" | mysql -u$MARIADB_USER -p$MARIADB_PASSWORD

	# Import database
	mysql -u$MARIADB_ADMIN_USER -p$MARIADB_ADMIN_PASSWORD $MARIADB_DATABASE < ./my_wordpress.sql
fi

service mysql stop

exec "$@"
