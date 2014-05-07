eval "$(rbenv init -)"
export GEM_HOME="$HOME/.gems"

export PATH="/usr/local/bin:$GEM_HOME/bin:/usr/local/share/npm/bin:$PATH"
export EDITOR='/usr/local/bin/mate -w'

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=*' 'l:|=* r:|=*'

SAVEHIST=10000
HISTSIZE=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

slash-backward-kill-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-kill-word
bindkey '^W' slash-backward-kill-word

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
