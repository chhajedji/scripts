#!/bin/bash

# PROMPT_COMMAND="pwd > '${HOME}/.cwd'; $PROMPT_COMMAND"
# source: i3 forums, http://blog.soulshake.net/2016/03/i3-new-terminals-in-pwd/


# Change to saved working dir
# pwd > '${HOME}/.cwd'
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)" && $TERMINAL
