#!/bin/bash

# PROMPT_COMMAND="pwd > '/tmp/cwd'; $PROMPT_COMMAND"
# source: i3 forums, http://blog.soulshake.net/2016/03/i3-new-terminals-in-pwd/


# Change to saved working dir
[[ -f "/tmp/cwd" ]] && cd "$(< /tmp/cwd)" && $TERMINAL || $TERMINAL
