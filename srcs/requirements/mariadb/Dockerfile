FROM		debian:buster

RUN			apt-get update -y
RUN			apt-get upgrade -y
RUN			apt-get -y install mariadb-server vim sudo procps dumb-init

RUN			chmod +x /usr/bin/dumb-init

WORKDIR		/

RUN			mkdir -p /var/run/mysqld
RUN			chown -R mysql:mysql /var/run/mysqld
RUN			chmod 777 /var/run/mysqld

COPY		./tools/init.sh ./init.sh
COPY		./conf/my_wordpress.sql ./my_wordpress.sql

RUN			chmod +x ./init.sh

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "./init.sh"]

CMD			["mysqld", "--bind-address=0.0.0.0"]
