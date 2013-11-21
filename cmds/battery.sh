#!/bin/zsh

battery=$(acpi -b | sed 's/Battery 0: //; s/ until charged//; s/ remaining//; s/Charging/C/; s/Discharging/D/; s/Full, //; s/Unknown, //; s/,//g;')

echo -n "$WMII_NORMCOLORS" $battery
