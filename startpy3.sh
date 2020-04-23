#!/bin/sh

# Default terminal is urxvt.
[ -n "$TERMINAL" ] || export $TERMINAL="urxvt"
(command -v python3 >/dev/null && $TERMINAL -name dropdown_python -e sh -c 'python3 -q' &)
