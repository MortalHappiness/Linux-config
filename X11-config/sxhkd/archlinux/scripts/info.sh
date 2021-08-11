#!/bin/sh
#
# Show information pop up window with dzen2

# =======================================

screen_width=1920
screen_height=1080

width=400
line_height=50

lines=9

x_offset=$(( ($screen_width-$width)/2  ))
y_offset=$(( ($screen_height-($lines+1)*$line_height)/2  ))

event="onstart=uncollapse"
timeout=2
font="Cousine:size=15:style=Bold"

# =======================================

function battery_status() {
    status="$(cat /sys/class/power_supply/BAT0/capacity)% "
    status+="[$(cat /sys/class/power_supply/BAT0/status)]"
    echo $status
}

function volume() {
    echo $(amixer get Master | tail -n 1 | awk '{print $4 $6}')
}

function backlight() {
    echo $(( $(brightnessctl get)*100/$(brightnessctl max) ))%
}

function touchpad() {
    touchpad="$(xinput list --name-only | grep 'Touchpad')"
    state=$(xinput list-props "$touchpad" | grep 'Device Enabled' | cut -f3)
    if [ "$state" == "1" ]; then
        echo "Enabled"
    else
        echo "Locked"
    fi
}


# =======================================


function echo_info {
    echo "Information"
    format="^ib(1)^fg(#cccccc)^r(400x50)^p(-400)^fg(#000000)"
    echo "${format} Workspace: $(bspc query -D -d focused --names)"
    echo "${format}---------------------------------"
    echo "${format} Battery: $(battery_status)"
    echo "${format} Volume: $(volume)"
    echo "${format} Backlight: $(backlight)"
    echo "${format} Touchpad: $(touchpad)"
    echo "${format}---------------------------------"
    echo "${format} Date: $(date +%Y/%m/%d) $(date +%A)"
    echo "${format} Time: $(date +%H:%M)"
}

echo_info | \
    dzen2 -p $timeout \
    -w $width \
    -h $line_height \
    -x $x_offset \
    -y $y_offset \
    -fg "#ffffff" \
    -bg "#333333" \
    -e $event \
    -l $lines \
    -fn $font

