# cp /tmp/redis.conf /etc/redis/redis.conf

chmod 777 /etc/redis/redis.conf

# Run by Dumb Init
redis-server /etc/redis/redis.conf
