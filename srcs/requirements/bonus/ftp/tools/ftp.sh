service vsftpd start

adduser $ftp_user
echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd

mkdir /var/ftp
chown nobody:nogroup /var/ftp

cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

echo "listen=NO
listen_ipv6=YES
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
allow_writeable_chroot=YES
pasv_enable=Yes
pasv_min_port=30000
pasv_max_port=30009
pam_service_name=vsftpd
user_sub_token=$USER
local_root=/var/ftp
userlist_enable=YES
userlist_file=/etc/vsftpduserlist.conf
userlist_deny=NO" > /etc/vsftpd.conf

echo "$ftp_user" >> /etc/vsftpduserlist.conf

service vsftpd stop

exec vsftpd



# mini source
# https://hostadvice.com/how-to/web-hosting/ubuntu/how-to-install-and-configure-vsftpd-on-ubuntu-18-04/