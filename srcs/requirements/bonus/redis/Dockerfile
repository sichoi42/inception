FROM        alpine:3.13

RUN         apk update && \
            apk add redis && \
            wget -O /usr/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64

RUN			chmod +x /usr/bin/dumb-init

COPY		./tools/init.sh /tmp/init.sh
# COPY		./conf/redis.conf /tmp/redis.conf

RUN			chmod +x /tmp/init.sh
# RUN			chmod 777 /tmp/redis.conf

# Handle Every Signal Correctly by Dumb Init to PID 1
ENTRYPOINT	["/usr/bin/dumb-init", "--", "bash", "/tmp/init.sh"]
