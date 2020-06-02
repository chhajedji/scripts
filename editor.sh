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
	emacsclient -c || emacs
	;;

    -v)
	[ -n "$TERMINAL" ] || TERMINAL="urxvt"; $TERMINAL -e vi
	;;
    *)
	{ { type emacs >/dev/null && { emacsclient -c || emacs; }; } ||
	      { [ -n "$TERMINAL" ] || TERMINAL="urxvt"; $TERMINAL -e vi; }; }&
esac
