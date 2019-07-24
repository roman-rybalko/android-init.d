set -x
set -e

# start VPN
am start -a android.intent.action.MAIN -e de.blinkt.openvpn.api.profileName rockbox de.blinkt.openvpn/.api.ConnectVPN

# wait for vpn
while ! ping -c 1 172.31.255.1; do
    sleep 1
done

ip route add 239.255.255.250/32 table tun0 dev tun0 # UPnP IGD

# FYI: stop VPN
#am start -a android.intent.action.MAIN de.blinkt.openvpn/.api.DisconnectVPN

ip route get 239.255.255.250
ip route list table all

exit 0
