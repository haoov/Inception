#!bin/sh

set -ex

sleep 10

if [ -f wp-config.php ]; then
	echo "wordpress already configured"
else
	#create the wp-config.php file with the rights values
	wp config create --dbname="${MARIADB_DATABASE}" --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=${MARIADB_HOSTNAME} --allow-root
	#change
	sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf
fi

exec "$@"