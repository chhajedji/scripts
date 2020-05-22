#!/bin/sh

# Opens blank file in emacs if emacs is installed or in vi.
# You need to run `emacs --daemon` for `emacsclient` to work which
# will open faster than normal emacs.

{ { type emacs >/dev/null && { emacsclient -c || emacs; }; } ||
    { [ -n "$TERMINAL" ] || TERMINAL="urxvt"; $TERMINAL -e vi; }; }&
