FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get -y install mariadb-server vim sudo procps dumb-init && \
			chmod +x /usr/bin/dumb-init

WORKDIR		/

RUN			mkdir -p /var/run/mysqld && \
			chown -R mysql:mysql /var/run/mysqld && \
			chmod 777 /var/run/mysqld

COPY		./tools/init.sh ./init.sh
COPY		./conf/my_wordpress.sql ./my_wordpress.sql

RUN			chmod +x ./init.sh

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "./init.sh"]

CMD			["mysqld", "--bind-address=0.0.0.0"]
