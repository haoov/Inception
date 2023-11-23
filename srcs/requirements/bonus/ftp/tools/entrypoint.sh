#!/bin/bash

if [ ! -f /etc/vsftpd.userlist ]; then
	#changing the password for ftp connection
	chpasswd <<< ftpuser:${FTP_PASSWORD}

	echo ftpuser >> /etc/vsftpd.userlist

	chown ftpuser /home/ftpuser/ftp/files

	#uncomment to allow write operations (upload)
	sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf
	sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf

	#add config options to config file
	cat <<- EOF >> /etc/vsftpd.conf
		local_enable=YES
		allow_writeable_chroot=YES
		pasv_enable=YES
		local_root=/home/ftpuser/ftp
		pasv_min_port=10000
		pasv_max_port=10010
		userlist_file=/etc/vsftpd.userlist
	EOF
fi

exec "$@"