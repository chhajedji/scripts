#!/bin/sh

# Screencast your keys
# 
# optional arguments:
#   -h, --help            show this help message and exit
#   --no-detach           do not detach from the parent
#   -d, --debug           enable debugging (implies --no-detach)
#   --no-systray          do not create system tray icon
#   -t TIMEOUT, --timeout TIMEOUT
#                         timeout in seconds
#   -p {top,center,bottom,fixed}, --position {top,center,bottom,fixed}
#                         set vertical position
#   --persist             make window persistent
#   -s {large,medium,small}, --font-size {large,medium,small}
#                         set font size
#   -g GEOMETRY, --geometry GEOMETRY
#                         set fixed area/window geometry
#   --key-mode {composed,translated,keysyms,raw}
#                         set key processing mode
#   --bak-mode {normal,baked,full}
#                         backspace processing mode
#   --mods-mode {normal,emacs,mac}
#                         modifiers visualization mode
#   -m, --mods-only       show only keys with modifiers pressed
#   --multiline           span text over multiple lines
#   --vis-shift           always show Shift when modifiers are pressed
#   --no-whitespace       disable visualization of whitespace
#   --show-settings       show settings dialog on start
#   --scr SCREEN          show on the specified screen number
#   -f FONT_DESC, --font FONT_DESC
#                         set font family/weight
#   --font-color FONT_COLOR
#                         set font color
#   --bg-color BG_COLOR   background color
#   --opacity OPACITY     window opacity (in range 0.0-1.0)
#   --ignore KeySym       Ignore the specified KeySym
#   --compr-cnt COUNT     Compress key repeats after the specified count
#   --version             show program's version number and exit

pgrep -x screenkey && pkill screenkey && echo "Screenkey turned off." ||
        screenkey --font-size small --timeout 1 --font "Monospace" --font-color "#ff0000" --opacity 0.7 --bak-mode baked --vis-shift --scr 0 &&
            echo "Screenkey turned on."
