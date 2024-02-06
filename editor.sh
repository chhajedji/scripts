#!/bin/sh

# Opens editor based on input argument.
#     -e for emacsclient or emacs
#     -v for Vi
# Default behavior:
#    Opens blank file in emacs if emacs is installed or in vi.
#    You need to run `emacs --daemon` for `emacsclient` to work which
#    will open faster than normal emacs.

case "$1" in

    -e)
	setsid emacsclient -c >/dev/null 2>&1 || emacs >/dev/null 2>&1
	;;

    -v)
	[ -n "$TERMINAL_LITE" ] || TERMINAL_LITE="xfce4-terminal"; $TERMINAL_LITE -e vi
	;;
    *)
	{ { type emacs >/dev/null && { emacsclient -c || emacs; }; } ||
	      { [ -n "$TERMINAL_LITE" ] || TERMINAL_LITE="xfce4-terminal"; $TERMINAL_LITE -e vi; }; } &
esac
