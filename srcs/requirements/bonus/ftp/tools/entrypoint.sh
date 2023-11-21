#!/bin/bash

#changing the password for ftp connection
chpasswd <<< ftpuser:${FTP_PASSWORD}

echo ftpuser >> /etc/vsftpd.userlist

#uncomment to allow write operations (upload)
sed -i 's/#write_enable=YES/write_enable=YES/g' /etc/vsftpd.conf

#add config options to config file
cat <<- EOF >> /etc/vsftpd.conf
	local_enable=YES
	allow_writeable_chroot=YES
	pasv_enable=YES
	local_root=/var/www/html
	pasv_min_port=40000
	pasv_max_port=40005
	userlist_file=/etc/vsftpd.userlist
EOF

exec "$@"