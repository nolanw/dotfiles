eval "$(rbenv init -)"
PATH="/usr/local/bin:$PATH"
PATH=$PATH:`brew --prefix go`/bin
NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
for f in `brew --prefix`/etc/bash_completion.d/*; do source $f; done
PS1='\[\033]0;\w\007\]$(__git_ps1 "%s ")⌘ '
EDITOR="/usr/local/bin/mate -w"
alias g='git'
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
  || complete -o default -o nospace -F _git g
alias iossim='open `xcode-select --print-path`/../Applications/iPhone\ '\
'Simulator.app'
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'
