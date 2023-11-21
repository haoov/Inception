FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASSWORD

RUN	apt-get update -y; \
	apt-get upgrade -y; \
	apt-get install -y vsftpd
	# adduser ${FTP_USER}; \
	# echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswdv; \
	# chown -R ${FTP_USER}:${FTP_USER} /var/www/html; \
	# echo ${FTP_USER} | tee -a /etc/vsftpd.userlist

COPY conf/vsftpd.conf /etc/vsftpd.conf

CMD tail -f > /dev/null
#CMD ["vsftpd", "/etc/vsftpd.cond"]