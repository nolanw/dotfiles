export PATH="/usr/local/bin:$PATH"
export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"
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

# Opens the sole Xcode workspace or Xcode project in a directory.
#
# - Parameters:
#   - "beta", if passed, will try to open the workspace/project in Xcode-beta.app.
#   - An optional directory that, if passed, will be searched for workspaces and projects.
xcopen() (
  local beta=
  local dir=
  if [ "$1" = "beta" ]; then
    beta="-beta"
    dir=$2
  else
    dir=$1
    [ "$2" = "beta" ] && beta="-beta"
  fi
  dir=${dir:-.}
  
  setopt null_glob
  IFS=$'\n'
  
  local workspaces=
  workspaces=("$dir"/*.xcworkspace)
  [ "${#workspaces}" -eq 1 ] && {
    open -a Xcode"$beta" "${workspaces[1]}"
    return 
  }
  
  local projects=
  projects=("$dir"/*.xcodeproj)
  [ "${#projects}" -eq 1 ] && {
    open -a Xcode"$beta" "${projects[1]}"
    return
  }
  
  if [ $(( ${#workspaces} + ${#projects} )) -gt 1 ]; then
    echo "Wanted exactly one Xcode workspace or project, but found multiple."
  else
    echo "Couldn't find any Xcode workspaces or projects."
  fi
)

export COCOAPODS_DISABLE_STATS=1
export FASTLANE_OPT_OUT_USAGE=1

hash direnv 2>/dev/null && eval "$(direnv hook zsh)"

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%~ ${vcs_info_msg_0_}%# '

[ -f .zshrc-local ] && source .zshrc-local
