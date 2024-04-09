# Abbrev
if status --is-interactive
    abbr --add b 'bundle exec'
    abbr --add bb 'bbedit'
    abbr --add g 'git'
end

# Android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
if test -d $ANDROID_HOME
    fish_add_path -a $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $ANDROID_HOME/tools.bin
end

# direnv
if type -q direnv
    eval (direnv hook fish)
end

# EDITOR
set -gx EDITOR vim
set -gx VISUAL $EDITOR

# Gunk
set -gx COCOAPODS_DISABLE_STATS true
set -gx FASTLANE_SKIP_UPDATE_CHECK 1

# Go
set -gx GOPATH $HOME/.go
fish_add_path -p $GOPATH/bin

# Homebrew
if test -d /opt/homebrew
    set -g -x HOMEBREW_PREFIX /opt/homebrew
    fish_add_path -p $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin
    set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
    set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX
    set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1
    set -gx HOMEBREW_NO_ANALYTICS 1
end

# MacPorts
fish_add_path -p /opt/local/bin /opt/local/sbin

# pyenv
set -gx PYENV_ROOT $HOME/.pyenv
if test -d $PYENV_ROOT
    fish_add_path -p $PYENV_ROOT/bin $PYENV_ROOT/shims
    if type -q pyenv; and status --is-interactive
        # too slow!
        #pyenv init - | source
    end
end

# ripgrep
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc

# rubygems
set -gx GEM_HOME $HOME/.gem
if type -q ruby
    # too slow! faster way?
    #fish_add_path (ruby -r rubygems -e 'puts Gem.user_dir')/bin
end

# local_config
set -l local_config $HOME/.local_config.fish
if test -f $local_config
    source $local_config
end

