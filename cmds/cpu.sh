#!/bin/zsh

# cpu_freq=$(grep "cpu MHz" /proc/cpuinfo | sed 's/[\t ]*//g; s/cpuMHz://g')

# cpu0=$(echo "scale=2;" `echo $cpu_freq | head -n 1 | tail -n 1` / 1000 | bc)
# cpu1=$(echo "scale=2;" `echo $cpu_freq | head -n 2 | tail -n 1` / 1000 | bc)
# cpu2=$(echo "scale=2;" `echo $cpu_freq | head -n 3 | tail -n 1` / 1000 | bc)
# cpu3=$(echo "scale=2;" `echo $cpu_freq | head -n 4 | tail -n 1` / 1000 | bc)

stat=$(mpstat | tail -n 1 | tr -s ' ')
usr=$(echo $stat | cut -d ' ' -f 4)
nice=$(echo $stat | cut -d ' ' -f 5)
sys=$(echo $stat | cut -d ' ' -f 6)
cpu=$(echo $usr + $nice + $sys | bc)

echo $cpu%
