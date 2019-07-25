set -x
set -e

# start VPN
am start -a android.intent.action.MAIN -e de.blinkt.openvpn.api.profileName rockbox de.blinkt.openvpn/.api.ConnectVPN

# FYI: stop VPN
#am start -a android.intent.action.MAIN de.blinkt.openvpn/.api.DisconnectVPN

exit 0
