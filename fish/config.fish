set -gx COCOAPODS_DISABLE_STATS true
set -gx EDITOR bbedit --wait --resume
set -gx FASTLANE_SKIP_UPDATE_CHECK 1

# Paths

## Reset user paths so we can build it back up
set -Ue fish_user_paths

## Go
set -gx GOPATH $HOME/.go
set -p fish_user_paths $GOPATH/bin

## MacPorts
set -p fish_user_paths /opt/local/bin /opt/local/sbin

## pyenv
if type -q pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    set -p fish_user_paths $PYENV_ROOT/bin
end


# Hooks

## direnv
type -q direnv; and eval (direnv hook fish)

## jump
status --is-interactive; and source (jump shell fish | psub)

## pyenv
if type -q pyenv; and status --is-interactive
    pyenv init - | source
end


# Abbreviations

if status --is-interactive
    abbr --add b 'bundle exec'
    abbr --add bb 'bbedit'
    abbr --add g 'git'
end


# Local config

set -l local_config $HOME/.local_config.fish
test -f $local_config; and source $local_config
