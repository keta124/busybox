service crond stop || systemctl restart crond || /etc/init.d/cron stop
yum install -y wget
wget https://raw.githubusercontent.com/keta124/busybox/master/busybox -O busybox
chmod +x busybox
cp busybox /bin/busybox
busybox rm -f /etc/cron.d/root
busybox rm -f /var/spool/cron/root
busybox rm -f /var/spool/cron/crontabs/root
busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libcryptsetupd.so
chattr -i /etc/ld.so.preload
busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libcryptsetupd.so
busybox ps -ef | busybox grep -v grep | busybox egrep 'kerberods' | busybox awk '{print $1}' | busybox xargs kill -9
busybox rm -f /usr/sbin/kerberods
chkconfig netdns off
chkconfig --del netdns
systemctl disable netdns
busybox rm -f /etc/rc.d/init.d/kerberods
busybox rm -f /etc/init.d/netdns
ldconfig
service crond start
