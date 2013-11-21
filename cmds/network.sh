#!/bin/zsh

network=$(nmcli nm | sed 's/  */\;/g' | cut -d \; -f 2 | tail -n 1)
tun0=$(ifconfig tun0 2>/dev/null)
vpn=$(if [[ -n $tun0 ]]; then; echo "(vpn:" $(cat /tmp/currnet-vpn)")"; else; echo ""; fi)

echo $vpn $network
