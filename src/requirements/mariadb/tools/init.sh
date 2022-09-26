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
	eval "echo \"$(cat ./my_wordpress.sql)\"" | mariadb
fi

service mysql stop

exec "$@"
