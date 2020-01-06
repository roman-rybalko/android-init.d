
# Restart adb (after network reset)

set -x
set -e

# IPv6 provides a global address.
# Prevent exposing adbd port to the internet.
ip6tables -I INPUT -p tcp --dport 5555 -j REJECT

setprop persist.internet.adb.enable 0
{
sleep 1
setprop persist.internet.adb.enable 1
} &
