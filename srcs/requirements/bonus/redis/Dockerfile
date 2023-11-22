FROM debian:bullseye

RUN	apt-get update -y; \
	apt-get install -y redis-server; \
	sed -i 's/# maxmemory <bytes>/maxmemory 2mb/g' /etc/redis/redis.conf

CMD ["redis-server", "--protected-mode no"]
