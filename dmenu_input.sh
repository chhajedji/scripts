#!/bin/sh

# If environmental variable `TERMINAL' is not set, then default terminal used: URxvt.

# Usage
# dmenu_input.sh -d: Do a dictionary search using dmenu.
# dmneu_input.sh -m: Search for a manpage.
# dmneu_input.sh -g: Do a google search in firefox.
# dmneu_input.sh -r: Open a git repo stored in `$HOME'.
# dmenu_input,sh -f: Open a terminal is a directory. Similar to fuzzy
#                    finder through dmenu but for directory instead of files.

DMENU_FONT1="Inconsolata 12"

# If "BROWSER" unset globally, set locally.
[ -n "$BROWSER" ] || BROWSER="firefox -new-window"
[ -n "$TERMINAL" ] || TERMINAL="urxvt"

case $1 in

# Search dictionary.
    -d)
        WORD=$(cat /usr/share/dict/words | dmenu -i -l 20 -p "Find meaning of:" -fn "$DMENU_FONT1")
        if [ -n "$WORD" ]; then
            $TERMINAL -name dropdown_dictionary -e sh -c "dict ${WORD} |less"
        fi
        ;;

# Open terminal in a directory.
        -f)
        DIR="$(find $HOME/ -type d -not -path '*/\.git/*' -not -path '*/\.git' 2>/dev/null |
            sed s:/home/$USER:~: | dmenu -i -l 20 -p "Go to directory:" -fn '$DMENU_FONT1')"

        if [ "$DIR" = "~/" ]; then
             cd $HOME && $TERMINAL &
         else
             # Cut the '~/' part from the `DIR'.
             DIR="$(echo $DIR | cut -d '/' -f2-)"

            # If user selected any directory then open `$TERMINAL' in that directory.
            [ "$DIR" = "" ] || { cd $HOME/$DIR && $TERMINAL; } &
        fi
        ;;


# Search google or open a URL.
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

# Open terminal in a git repo.
    -r)
        mkdir -p $HOME/.tmp
        [ -e $HOME/.tmp/gitfiles ] || find $HOME/ -regex .*/\.git$ -type d 2>/dev/null > $HOME/.tmp/gitfiles
        REPOS="$(cat $HOME/.tmp/gitfiles | xargs dirname  | sed s:/home/$USER:~: | dmenu -i -l 20 -p 'Select git repo to open' -fn '$DMENU_FONT1')"

        # Cut the '~/' part from the `REPOS'.
        REPOS="$(echo $REPOS | cut -d '/' -f2-)"

        # If user selected any repo then open `$TERMINAL' in that repo.
        [ "$REPOS" = "" ] || { cd $HOME/$REPOS && $TERMINAL; } &
        ;;

# Manual page.
    -m)
        # Store list of all available man pages in a file.
        apropos . |sort >/tmp/manlist.txt
        WORD=$(cat /tmp/manlist.txt | dmenu -l 20 -p "Manual page for:" -fn "$DMENU_FONT1" | cut -d ' ' -f 1)
        echo $WORD
        if [ -n "$WORD" ]; then
            $TERMINAL -name dropdown_manual -e sh -c "man ${WORD} || figlet -c 'No manual entry for \"${WORD}\"' |less" >/dev/null
            # exec i3-msg [instance="dropdown_manual"] focus >/dev/null
        fi
    ;;

    *)
        MESSAGE="Not a valid option to run. :P"
        $TERMINAL -name dropdown_default -e sh -c "figlet -c ${MESSAGE} |less" >/dev/null
    ;;

esac
