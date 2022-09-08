
# # Check Whether Already Set Up or Not by Custom File
# cat .setup 2> /dev/null

# # If Not Set Up Yet
# if [ $? -ne 0 ]; then

# sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0\nport=3306/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# fi

sleep 5

service mysql start
