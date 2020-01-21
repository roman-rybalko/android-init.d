set -x

if [ "$1" != bg ]; then
	# init

	#rm /sdcard/reboot.flag

	#
	
	sh "$0" bg &
	exit 0
fi

# main

#[ -e /sdcard/reboot.flag ] && sleep 60
#[ -e /sdcard/reboot.flag ] && reboot

#if [ -e /sdcard/60-adb.sh ]; then
#	sh /sdcard/60-adb.sh &
#	rm /sdcard/60-adb.sh
#fi

#date
#ifconfig eth0 down
#sleep 10
#ifconfig -a
#date
#ifconfig eth0 up
#sleep 10
#ifconfig -a

#

sleep 60
exec sh "$0" bg
