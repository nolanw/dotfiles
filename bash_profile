eval "$(rbenv init -)"
export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
PS1='\[\033]0;\w\007\]$(__git_ps1 "%s ")⌘  '

