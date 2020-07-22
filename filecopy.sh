#!/bin/bash

command -v xclip >/dev/null 2>&1 || { echo "Need command xclip. Aborting." >&2; exit 1; }
[[ -f "$1" ]] || { echo "Error: Not a file." >&2; exit 1; }
TYPE=$(file -b --mime-type "$1")
xclip -selection clipboard -t "$TYPE" < "$1"
echo "$1 copied to clipboard."
