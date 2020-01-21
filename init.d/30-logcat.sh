set -x
set -e

logcat -f /sdcard/logcat.txt -r 100000 -n 10 &

exit 0
