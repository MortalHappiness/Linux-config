#!/bin/sh
#
# Show a popup notification with dzen2

title=$1
msg=$2
width=$3

screen_width=1920
screen_height=1080

title_height=70
msg_height=70

x_offset=$(( ($screen_width-$width)/2  ))
title_y_offset=$(( ($screen_height-$msg_height-$title_height)/2  ))
msg_y_offset=$(( $title_y_offset+$title_height   ))

fg_color='#ffffff'
title_bg_color='#333333'
msg_bg_color='#555555'

title_font='Cousine:size=30:style=Bold'
msg_font='Cousine:size=30'

timeout=1
event="''"

# =======================================

echo "$title" | \
    dzen2 -p $timeout \
          -w $width \
          -h $title_height \
          -x $x_offset \
          -y $title_y_offset \
          -fg $fg_color \
          -bg $title_bg_color \
          -e $event \
          -fn $title_font &

echo "$msg" | \
    dzen2 -p $timeout \
          -w $width \
          -h $msg_height \
          -x $x_offset \
          -y $msg_y_offset \
          -fg $fg_color \
          -bg $msg_bg_color \
          -e $event \
          -fn $msg_font &

