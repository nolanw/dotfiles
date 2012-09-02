eval "$(rbenv init -)"
export PATH="/usr/local/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
PS1='\[\033]0;\w\007\]$(__git_ps1 "%s ")⌘ '
export EDITOR="/usr/local/bin/mate -w"
