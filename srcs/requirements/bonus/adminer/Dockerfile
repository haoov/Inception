FROM debian:bullseye

RUN apt-get update -y; \
	apt-get install adminer php-fpm -y; \
	mkdir -p /run/php; \
	sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /usr/share/adminer

RUN	./compile.php; \
	mv adminer-*.php /var/www/html/index.php

CMD ["php-fpm7.4", "--nodaemonize"]
