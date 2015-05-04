export PATH="/usr/local/bin:$PATH"
export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
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

# http://superuser.com/a/328148
# Tell Terminal.app about the working directory whenever it changes.
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL, including the host name to disambiguate local vs. remote paths.

        # Percent-encode the pathname.
        local URL_PATH=''
        {
            # Use LANG=C to process text byte-by-byte.
            local i ch hexch LANG=C
            for ((i = 1; i <= ${#PWD}; ++i)); do
                ch="$PWD[i]"
                if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
                    URL_PATH+="$ch"
                else
                    hexch=$(printf "%02X" "'$ch")
                    URL_PATH+="%$hexch"
                fi
            done
        }

        local PWD_URL="file://$HOST$URL_PATH"
        printf '\e]7;%s\a' "$PWD_URL"
    }

    # Register the function so it is called whenever the working directory changes.
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    # Tell the terminal about the initial directory.
    update_terminal_cwd
fi

alias ls='ls -G'

md() { pandoc "$1" | lynx -stdin }

alias g='git'
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b "
zstyle ':vcs_info:git*' actionformats "%b (%a) "

alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'
alias iossim='open "`xcode-select --print-path`/../Applications/iPhone Simulator.app"'

xcopen() {
  setopt null_glob
  IFS=$'\n' workspaces=(*.xcworkspace)
  if [ ${#workspaces[@]} -eq 1 ]; then
    open -a Xcode "${workspaces[0]}"
    return
  elif [ ${#workspaces[@]} -gt 1 ]; then
    echo "Too many workspaces"
    return
  fi
  
  IFS=$'\n' projects=(*.xcodeproj)
  if [ ${#projects[@]} -eq 1 ]; then
    open -a Xcode "${projects[0]}"
    return
  elif [ ${#projects[@]} -gt 1 ]; then
    echo "Too many projects"
    return
  else
    echo "No projects or workspaces found"
    return
  fi
}

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%~ ${vcs_info_msg_0_}%# '

[ -f .zshrc-local ] && source .zshrc-local
