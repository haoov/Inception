FROM debian:bullseye

RUN	apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y vsftpd; \
	adduser ftpuser --disabled-password; \
	mkdir /home/ftpuser/ftp; \
	mkdir /home/ftpuser/ftp/files; \
	mkdir -p /var/run/vsftpd /var/run/vsftpd/empty

COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]