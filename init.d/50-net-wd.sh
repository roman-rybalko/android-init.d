set -x

IF=eth0

while true; do
	if ! ifconfig $IF | grep -E 'inet.? addr'; then
		ifconfig $IF down
		sleep 10
		ifconfig $IF up
	fi
	sleep 600
done &

exit 0
