#!/system/bin/sh

# System V init.d support

init_d_dir="/sdcard/init.d"
log="/data/local/tmp/init.d.log"
wd="/data/local/tmp"

umask 022
cd "$wd"
[ -n "$1" ] || exec "$0" logged >"$log" 2>&1 </dev/null

set -x

while [ ! -e "$init_d_dir" ]; do
    sleep 1
done

for s in "$init_d_dir"/*.sh; do
    echo "$s"
done | sort | while read s; do
    sh "$s" >"$s".log 2>&1
done

exit 0
