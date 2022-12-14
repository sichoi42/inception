UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ADMIN_PASSWORD') WHERE User='$MARIADB_ADMIN_USER' AND Host='$MARIADB_DATABASE_HOST';

CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;

-- Create Another User for WordPress
CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';

-- Grant Permissions
GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' WITH GRANT OPTION;

-- Apply
FLUSH PRIVILEGES;
