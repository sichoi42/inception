
if [ ! -f "/etc/vsftpd/vsftpd.conf" ]; then

	sleep 5

	chmod 777 /tmp/vsftpd.conf

	mkdir -p /var/run/vsftpd/empty

	cp /tmp/vsftpd.conf /etc/vsftpd.conf

	adduser $FTP_USER --disabled-password

	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd > /dev/null

	echo "local_root=$FTP_PATH" >> /etc/vsftpd/vsftpd.conf

	# echo "ftpd_banner=Welcome to $FTP_USER FTP service!!" >> /etc/vsftpd.conf

	# echo $FTP_USER | tee -a /etc/vsftpd.userlist
fi

chgrp -R $FTP_USER $FTP_PATH
chown -R $FTP_USER $FTP_PATH
chmod -R +x $FTP_PATH

# Run by Dumb Init
vsftpd /etc/vsftpd.conf
