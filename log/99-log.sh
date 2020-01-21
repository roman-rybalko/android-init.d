set -x

LOG=/sdcard/log.txt

[ "$1" = log ] || exec sh "$0" log >>$LOG 2>&1

ip monitor &
ip xfrm monitor &

while true; do
	date
	ip xfrm state
	ip xfrm policy
	ifconfig
	route -n
	route -n -A inet6
	ip rule
	ip -6 rule
	ip rule | while read line; do
		if echo $line | grep lookup; then
			table=`echo $line | sed -r 's/.+ lookup ([^[:space:]]+).*/\1/'`
			ip route list table $table
		fi
	done
	ip -6 rule | while read line; do
		if echo $line | grep lookup; then
			table=`echo $line | sed -r 's/.+ lookup ([^[:space:]]+).*/\1/'`
			ip -6 route list table $table
		fi
	done
	for t in filter nat mangle; do
		iptables -L -v -n -t $t
	done
	for t in filter nat mangle; do
		ip6tables -L -v -n -t $t
	done
	ping -n -c 1 ya.ru
	ping -n -c 1 77.88.8.8
	ping6 -n -c 1 ya.ru
	ping6 -n -c 1 2a02:6b8:0:1::feed:0ff
	netstat -np
	netstat -npl
	ps
	df
	ls -l /data/local/tmp/
	stat /data/local/tmp/*
	dmesg | tail -n 100
	sleep 60
done &

exit 0
