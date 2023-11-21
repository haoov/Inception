#!bin/sh

set -ex

sleep 10

if [ -f wp-config.php ]; then
	echo "wordpress already configured"
else
	#create the wp-config.php file with the rights values
	wp config create --dbname="${MARIADB_DATABASE}" --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=${MARIADB_HOSTNAME} --allow-root
	#change listen on socket to port
	sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --allow-root
	wp config set WP_CACHE_KEY_SALT rsabbah.42.fr --allow-root
 	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
	wp redis enable --allow-root
fi

exec "$@"