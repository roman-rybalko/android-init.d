#!/system/bin/sh
# System V init.d support
export PATH=${PATH}:/system/bin:/system/xbin
logwrapper busybox run-parts /system/etc/init.d
