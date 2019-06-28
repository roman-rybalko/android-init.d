#!/system/bin/sh

set -x

mount -o rw,remount /system
cat /sdcard/init.d.rc > /system/etc/init/init.d.rc
chmod 0644 /system/etc/init/init.d.rc
cat /sdcard/init.d.sh > /system/bin/init.d.sh
chmod 0755 /system/bin/init.d.sh
#cat /sdcard/termux.rc > /system/etc/init/termux.rc
#cat /sdcard/test.rc > /system/etc/init/test.rc
#cat /sdcard/test.sh > /system/bin/test.sh
mount -o ro,remount /system
mount|grep system
ls -lZ /system/etc/init/init.d.rc /system/bin/init.d.sh
cat /etc/init/init.d.rc /system/bin/init.d.sh
#cat /etc/init/termux.rc
#ls -l /system/etc/init/test.rc /system/bin/test.sh
#cat /etc/init/test.rc
