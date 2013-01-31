eval "$(rbenv init -)"
export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH
export EDITOR='/usr/local/bin/mate -w'

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*' 'l:|=* r:|=*'

alias ls='ls -G'

alias g='git'
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b "
zstyle ':vcs_info:git*' actionformats "%b (%a) "

alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'
alias iossim='open "`xcode-select --print-path`/../Applications/iPhone Simulator.app"'

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%~ ${vcs_info_msg_0_}%# '
