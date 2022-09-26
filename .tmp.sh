/usr/sbin/ip addr |grep ens|grep inet|awk -v x=2 '{print $x}'|awk -F/ -v y=1 '{print $y}';
