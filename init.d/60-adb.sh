
# Restart adb (after network reset)

set -x
set -e

setprop persist.internet.adb.enable 0
{
sleep 1
setprop persist.internet.adb.enable 1
} &
