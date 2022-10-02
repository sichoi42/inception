# cp /tmp/redis.conf /etc/redis.conf

chmod 777 /etc/redis.conf

# Run by Dumb Init
redis-server /etc/redis.conf
