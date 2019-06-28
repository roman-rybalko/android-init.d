#!/system/bin/sh

# System V init.d support

init_d_dir="/sdcard/init.d"
log="/data/local/tmp/init.d.log"

umask 022
[ -n "$1" ] || exec "$0" logged >"$log" 2>&1

while [ ! -e "$init_d_dir" ]; do
    echo "Waiting for $init_d_dir"
    sleep 1
done
echo "$init_d_dir ready"

for s in "$init_d_dir"/*.sh; do
    echo "$s"
done | sort | while read s; do
    echo "Executing $s"
    sh "$s" >>"$s".log 2>&1
done
echo "$init_d_dir finished"
