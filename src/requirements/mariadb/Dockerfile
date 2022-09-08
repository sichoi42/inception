FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get -y install mariadb-server vim sudo procps dumb-init && \
			chmod +x /usr/bin/dumb-init


RUN			mkdir -p /run/mysqld /var/lib/mysql && \
			chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY		./conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY		./tools/init.sh /tmp/init.sh

RUN			chmod +x /tmp/init.sh

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--"]

CMD 		["mysqld_safe"]

