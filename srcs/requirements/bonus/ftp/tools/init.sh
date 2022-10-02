
if [ ! -f "/etc/vsftpd/vsftpd.conf" ]; then
	chmod 777 /tmp/vsftpd.conf

	cp /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

	adduser $FTP_USER --disabled-password --gecos "" --home /home/$FTP_USER --shell /bin/bash

	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

	echo "ftpd_banner=Welcome to $FTP_USER FTP service!!" >> /etc/vsftpd/vsftpd.conf
fi

chgrp -R $FTP_USER root
chown -R $FTP_USER root
chmod -R +x root

# Run by Dumb Init
vsftpd /etc/vsftpd/vsftpd.conf
