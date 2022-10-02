FROM		debian:buster

RUN			apt-get update
RUN			apt-get upgrade -y
RUN			apt-get install -y vsftpd dumb-init

RUN			chmod +x /usr/bin/dumb-init

COPY		./tools/init.sh /tmp/init.sh
COPY		./conf/vsftpd.conf /tmp/vsftpd.conf

RUN			chmod +x /tmp/init.sh

EXPOSE		21

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
