FROM debian:bullseye

RUN	apt-get update -y; \
	apt-get install -y vsftpd; \
	adduser ftpuser --disabled-password; \
	mkdir -p /var/www/html; \
	chown -R ftpuser /var/www/html; \
	mkdir -p /var/run/vsftpd /var/run/vsftpd/empty

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]
