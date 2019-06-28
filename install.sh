#!/system/bin/sh

set -x

mount -o rw,remount /system
cat /sdcard/init.d.rc > /system/etc/init/init.d.rc
chmod 0644 /system/etc/init/init.d.rc
cat /sdcard/init.d.sh > /system/bin/init.d.sh
chmod 0755 /system/bin/init.d.sh
mount -o ro,remount /system
mount|grep system
ls -lZ /system/etc/init/init.d.rc /system/bin/init.d.sh
cat /etc/init/init.d.rc /system/bin/init.d.sh
