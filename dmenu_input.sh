#!/bin/sh

DMENU_FONT1="Inconsolata 12"

case $1 in

# Search dictionary.
    -d)
        WORD=$(cat /usr/share/dict/words | dmenu -i -l 20 -p "Find meaning of:" -fn "$DMENU_FONT1")
        if [ -n "$WORD" ]; then
            urxvt -name dropdown_dictionary -e sh -c "dict ${WORD} |less"
        fi
        ;;

# Search google.
    -g)
        SEARCHURL='https://www.google.com/search?q='
        GOTOURL='https://'
        # QUERY=$(echo '' | dmenu -p "Search / Go to:" -fn "-xos4-terminus-medium-r-*-*-14-*")
        QUERY=$(echo '' | dmenu -p "Search / Go to:" -fn "$DMENU_FONT1")
        if [ -n "$QUERY" ]; then
            (echo $QUERY | grep ' ' >/dev/null && $BROWSER "${SEARCHURL}${QUERY}" && echo case 1) ||
                (echo $QUERY | grep '\.' >/dev/null && $BROWSER "${GOTOURL}${QUERY}" && echo case 2) ||
                ($BROWSER "${SEARCHURL}${QUERY}" && echo case 3)
        fi
        ;;

# Manual page.
    -m)
        # Store list of all available man pages in a file.
        apropos . |sort >/tmp/manlist.txt
        WORD=$(cat /tmp/manlist.txt | dmenu -l 20 -p "Manual page for:" -fn "$DMENU_FONT1" | cut -d ' ' -f 1)
        echo $WORD
        if [ -n "$WORD" ]; then
            urxvt -name dropdown_manual -e sh -c "man ${WORD} || figlet -c 'No manual entry for \"${WORD}\"' |less" >/dev/null
            # exec i3-msg [instance="dropdown_manual"] focus >/dev/null
        fi
        ;;

    *)
        MESSAGE="Not a valid option to run. :P"
        urxvt -name dropdown_default -e sh -c "figlet -c ${MESSAGE} |less" >/dev/null
        ;;

esac
