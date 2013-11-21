#!/bin/bash
set +xv
if wmiir remove /rbar/status 2>/dev/null; then
	sleep 2
fi

pkill network.sh
pkill memory.sh
pkill cpu.sh
pkill date.sh
pkill battery.sh
pkill email.sh

echo "$WMII_NORMCOLORS" | wmiir create /rbar/aaa_network
while ../cmds/network.sh | wmiir write /rbar/aaa_network; do
    sleep 5
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/bbb_memory
while ../cmds/memory.sh | wmiir write /rbar/bbb_memory; do
    sleep 10
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/ccc_cpu
while ../cmds/cpu.sh | wmiir write /rbar/ccc_cpu; do
    sleep 5
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/eee_date
while ../cmds/date.sh | wmiir write /rbar/eee_date; do
    sleep 15
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/fff_battery
while ../cmds/battery.sh | wmiir write /rbar/fff_battery; do
    sleep 30
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/ggg_email
while ../cmds/email.sh | wmiir write /rbar/ggg_email; do
    sleep 5
done &

echo "$WMII_NORMCOLORS" | wmiir create /rbar/ddd_volume
../cmds/volume.sh | wmiir write /rbar/ddd_volume
