set -x
set -e

# wait for time update
while [ ! timestamp -nt "$0" ]; do
    sleep 1
    touch timestamp
done
rm timestamp

exit 0
