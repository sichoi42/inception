FROM		debian:buster

RUN			apt-get update -y && \
			apt-get upgrade -y && \
			apt-get install -y \
			redis \
			dumb-init

RUN			chmod +x /usr/bin/dumb-init

COPY		./tools/init.sh /tmp/init.sh
# COPY		./conf/redis.conf /tmp/redis.conf

RUN			chmod +x /tmp/init.sh
# RUN			chmod 777 /tmp/redis.conf

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
