#!/bin/sh

# If environmental variable `TERMINAL' is not set, then default terminal used: URxvt.

# Usage

# dmenu_input.sh -o: Open a file with xdg-open.
# dmenu_input.sh -d: Do a dictionary search using dmenu.
# dmneu_input.sh -m: Search for a man page.
# dmneu_input.sh -g: Do a google search in firefox.
# dmneu_input.sh -r: Open a git repo stored in `$HOME'.
# dmenu_input.sh -f: Open a terminal is a directory. Similar to fuzzy
#                    finder through dmenu but for directory instead of files.
# dmenu_input.sh -l: Run an application or show all executables in the PATH.
# dmneu_input.sh -k: Kill a process.
# dmneu_input.sh -t: Set a timer To turn off notifications (Focus mode).
# dmenu_input.sh -w: Select WiFi network to connect.
# dmenu_input.sh -e: Options to exit system. To use this option, run script as a sudo user.
# dmenu_input.sh -a: Open file manager in desired directory.

DMENU_FONT1="Inconsolata"

# Set some locally used variables if not set globally.
[ -n "$BROWSER" ] || BROWSER="firefox -new-window"
[ -n "$TERMINAL" ] || TERMINAL="urxvt"
[ -n "$FILEMANAGER" ] || FILEMANAGER="dolphin"

case $1 in

    # Open file manager in desired directory.
    -a)
        DIR="$(fd . $HOME --type d 2>/dev/null | sed s:/home/$USER:~: |
        dmenu -i -l 20 -p "Choose a directory" -fn "$DMENU_FONT1")"

        # If a valid file is selected.
        if [ -n "$DIR" ]; then
            # Cut the '~/' part from the `DIR'.
            DIR="$(echo $DIR | cut -d '/' -f2-)"

            $FILEMANAGER "$DIR" &
        fi
        ;;

    # Open a file with xdg-open.
    -o)
        FILE="$(fd . $HOME --type f 2>/dev/null | sed s:/home/$USER:~: |
        dmenu -i -l 20 -p "Open which file?" -fn "$DMENU_FONT1")"

        # If a valid file is selected.
        if [ -n "$FILE" ]; then
            # Cut the '~/' part from the `DIR'.
            FILE="$(echo $FILE | cut -d '/' -f2-)"

            xdg-open "$FILE"
        fi
        ;;

    # Search dictionary.
    -d)
        WORD=$(cat /usr/share/dict/words | dmenu -i -l 20 -p "Find meaning of:" -fn "$DMENU_FONT1")
        if [ -n "$WORD" ]; then
            $TERMINAL -name dropdown_dictionary -e sh -c "dict ${WORD} |less"
        fi
        ;;

    # Open terminal in a directory.
    -f)
        DIR="$(fd . $HOME --type d 2>/dev/null | sed s:/home/$USER:~: |
        dmenu -i -l 20 -p "Go to directory:" -fn "$DMENU_FONT1")"

        if [ "$DIR" = "~/" ]; then
            cd $HOME && $TERMINAL &
        else
            # Cut the '~/' part from the `DIR'.
            DIR="$(echo $DIR | cut -d '/' -f2-)"

            # If user selected any directory then open `$TERMINAL' in that directory.
            [ "$DIR" = "" ] || { cd $HOME/$DIR && $TERMINAL; } &
        fi
        ;;

    # Run an application or show all executables in the PATH.
    # If the application is not found, or the name is incorrect, then all
    # executables will be displayed by `dmenu_run`
    -l)
        command -v 'j4-dmenu-desktop' >/dev/null &&
            { j4-dmenu-desktop --dmenu "dmenu -i -p 'Open application:' -fn "$DMENU_FONT1""; } ||
                { dmenu_run -i -p "Run command:" -fn "$DMENU_FONT1"; }
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
        REPOS="$(cat $HOME/.tmp/gitfiles | xargs dirname  | sed s:/home/$USER:~: | dmenu -i -l 20 -p 'Select git repo to open' -fn "$DMENU_FONT1")"

        # Cut the '~/' part from the `REPOS'.
        REPOS="$(echo $REPOS | cut -d '/' -f2-)"

        # If user selected any repo then open `$TERMINAL' in that repo.
        [ "$REPOS" = "" ] || { cd $HOME/$REPOS && $TERMINAL; } &
        ;;

    # Manual page.
    -m)
        # Store list of all available man pages in a file.
        apropos . | sort >/tmp/manlist.txt

        # In manlist.txt, entries are in the form

        #       signal (7)    - overview of signals

        # We need to modify this query in the form "7 signal" so that our query
        # can become `man 7 signal'. This will search 7th man page of signal
        # instead of default which is 2nd.

        WORD="$(cat /tmp/manlist.txt | dmenu -i -l 20 -p "Manual page for:" -fn "$DMENU_FONT1" | sed 's/\(.*\) (\([0-9]*\)).*/\2 \1/')"
        if [ -n "$WORD" ]; then
            echo "Showing result for \"man $WORD\""
            $TERMINAL -name dropdown_manual -e sh -c "man ${WORD} || figlet -c 'No manual entry for \"${WORD}\"' |less" >/dev/null
            # exec i3-msg [instance="dropdown_manual"] focus >/dev/null
        fi
        ;;

    # Kill a process listed in ps aux
    -k)
        # Substitute one or more blank spaces with a |.
        QUERY="$(ps aux | dmenu -i -l 20 -p 'Kill who?' |  sed -E 's/ +/|/g' )"
        if [ -n "$QUERY" ]; then
            # If owner is different, don't be evil.
            ME=$(whoami)
            echo $QUERY | grep -q "^$ME" || { notify-send "[!] Only processes owned by \"$ME\" can be killed." && exit 1; }
            # echo $QUERY
            KILLPID="$(echo $QUERY | cut -d "|" -f 2)"
            KILLEDNAME="$(echo $QUERY | cut -d '|' -f11- | sed 's/|/ /g')"
            kill $KILLPID &&
                { echo Killed \"$KILLEDNAME\" && notify-send "Killed \"$KILLEDNAME\""; } ||
                { echo "Unable to kill process $KILLPID" && notify-send "Unable to kill process $KILLPID"; }
        fi
        ;;

    # Stop notifications for specified time in minutes.
    -t)
        TIMER=$(echo -n "" | dmenu -p 'Minutes to stop notifications:' -fn "$DMENU_FONT1")
        if [ -n "$TIMER" ]; then
            # Enter 0 to resume notifications.
            if [ 0 -eq $TIMER ]; then
                notify-send "DUNST_COMMAND_RESUME"
                notify-send "Notifications resumed."
                exit 0
            fi

            notify-send -t 3500 "Turning on Focus mode for $TIMER minutes."
            sleep 4s
            notify-send "DUNST_COMMAND_PAUSE"
            sleep "$TIMER"m
            notify-send "DUNST_COMMAND_RESUME"
            notify-send "Focus mode turned off."
        fi
        ;;
    # Search for WiFi networks and connect to selected one.
    -w)
        notify-send -t 1500 "Searcing for WiFi networks.."
        WIFICURRENT="$(nmcli dev wifi | sed -n 's/^* *\([^ ]*\).*/\1/p')"
        echo "Current network is $WIFICURRENT"

        WIFISELECT=$(nmcli dev wifi | dmenu -i -fn "$DMENU_FONT1" -l 20 -p 'Select WiFi network to connect')
        if [ -n "$WIFISELECT" ]; then
            WIFIBSSID=$(echo $WIFISELECT | sed -n 's/^.*\([A-Fa-f0-9:]\{17\}\).*/\1/p')

            echo "Connecting to $WIFIBSSID"

            if [ "$WIFICURRENT" != "$WIFIBSSID" ]; then
                nmcli d wifi connect $WIFIBSSID
            else
                echo "Already connected to this network."
            fi
        fi
        ;;

    # Turn off system.
    -e)
        OPTION=$(printf "Sleep\nPower off\nRestart\nLogout\n" | dmenu -i -fn "$DMENU_FONT1" -p 'Select option')
        echo $OPTION
        if [ -n "$OPTION" ]; then
            case $OPTION in
                "Logout")
                    notify-send "Logging out now.."
                    sleep 2s
                    sudo pkill -u $USER
                    ;;
                "Power off")
                    notify-send "Force shutting down now.."
                    sleep 2s
                    sudo shutdown now
                    ;;
                "Restart")
                    notify-send "Force restarting now.."
                    sleep 2s
                    sudo shutdown -r now
                    ;;
                "Sleep")
                    notify-send -t 1500 "Suspending now.."
                    sleep 2s
                    suspend_lock.sh
            esac
        fi
        ;;

    *)
        MESSAGE="Not a valid option to run. :P"
        $TERMINAL -name dropdown_default -e sh -c "figlet -c ${MESSAGE} |less" >/dev/null
        ;;

esac
