#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

# If Configuration File Needs to be Changed
if [ $? -eq 0 ]; then
#   Change the Listening Host with 9000 Port
#   sed -i "s/.*listen = 127.0.0.1.*/listen = 9000/g" /etc/php/7.3/fpm/pool.d/www.conf
  # Append Env Variables on the Configuration File
  echo "env[MARIADB_HOST] = \$MARIADB_HOST" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[MARIADB_ADMIN_USER] = \$MARIADB_ADMIN_USER" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[MARIADB_ADMIN_PASSWORD] = \$MARIADB_ADMIN_PASSWORD" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "env[MARIADB_DATABASE] = \$MARIADB_DATABASE" >> /etc/php/7.3/fpm/pool.d/www.conf
  echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf
fi

chown -R :www-data /var/www/wordpress

# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	# Copy Configuration File
  	# cp /tmp/wp-config.php /var/www/wordpress/wp-config.php

	# sleep 5

	# if ! mysqladmin -h $MARIADB_HOST -u $MARIADB_ADMIN_USER --password=$MARIADB_ADMIN_PASSWORD --wait=42 ping > /dev/null; then
	# 	echo -e "${RED} Mariadb is not reachable\n ${RESET}"
	# 	exit 1
	# fi
	wp core download --path=/var/www/wordpress --allow-root
	wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=$MARIADB_HOST --dbcharset="utf8" --allow-root
	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path=/var/www/wordpress --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	wp plugin update --all --allow-root

	cp -r /var/www/wordpress /var/www/html/
# fi

# Run by Dumb Init
exec php-fpm7.3 -R -F
