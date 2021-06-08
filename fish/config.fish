set -gx EDITOR bbedit --wait --resume

# Gunk

set -gx COCOAPODS_DISABLE_STATS true
set -gx FASTLANE_SKIP_UPDATE_CHECK 1
set -gx HOMEBREW_NO_ANALYTICS 1


# Paths

## Reset user paths so we can build it back up
set -Ue fish_user_paths

## Local stuff
set -p fish_user_paths $HOME/bin

## Go
set -gx GOPATH $HOME/.go
set -p fish_user_paths $GOPATH/bin

## Homebrew
if test -d /opt/homebrew
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -p fish_user_paths $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin
    set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX
end

## pyenv
if type -q pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    set -p fish_user_paths $PYENV_ROOT/shims
end


# Hooks

## direnv
type -q direnv; and eval (direnv hook fish)

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
