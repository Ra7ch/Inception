
#!/bin/bash


service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser $ftp_user --disabled-password

echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd

echo "$ftp_user" >> /etc/vsftpd.userlist

chown -R $ftp_user:$ftp_user /var/www/html

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/var/www/html
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop


/usr/sbin/vsftpd