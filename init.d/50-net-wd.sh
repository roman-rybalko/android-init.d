set -x

IF=eth0

while true; do
	if ! ifconfig $IF | grep -E 'inet.? addr'; then
		date
		ifconfig $IF down
		sleep 10
		ifconfig $IF up
		sleep 10
		ip xfrm state flush
	fi
	sleep 600
done &

exit 0
