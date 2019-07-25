set -x
set -e

# see http://romanr.info/android/
# binaries: http://romanr.info/android/android-openvpn.tgz

# disable Android routing
ip rule add prio 100 lookup main

# start openvpn
/data/openvpn/openvpn.sh --cd /sdcard/openvpn --config rockbox.conf &

exit 0
