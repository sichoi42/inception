# cp /tmp/redis.conf /etc/redis/redis.conf

chmod 777 /etc/redis/redis.conf

sed -i "s/bind 127.0.0.1/bind 0.0.0.0/g" /etc/redis/redis.conf
sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf

# Run by Dumb Init
redis-server /etc/redis/redis.conf
