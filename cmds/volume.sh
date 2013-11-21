#!/bin/zsh

sound=$(amixer sget Master | tail -n 1)
level=$(echo -n $sound | cut -d ' ' -f 6 | sed 's/\[//; s/]//')
mute=$(echo -n $sound | cut -d ' ' -f 8 | sed 's/\[on\]//')

if [[ -z "$mute" ]]; then
    echo -n $level
else
    echo -n $level '(mute)'
fi
