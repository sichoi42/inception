
if [ ! -f "/etc/vsftpd/vsftpd.conf" ]; then
	chmod 777 /tmp/vsftpd.conf

	mkdir -p /var/run/vsftpd/empty

	cp /tmp/vsftpd.conf /etc/vsftpd.conf

	adduser $FTP_USER --disabled-password

	echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

	chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress

	echo "ftpd_banner=Welcome to $FTP_USER FTP service!!" >> /etc/vsftpd.conf

	echo $FTP_USER | tee -a /etc/vsftpd.userlist
fi

# Run by Dumb Init
vsftpd /etc/vsftpd.conf
