set -gx COCOAPODS_DISABLE_STATS true
set -gx EDITOR bbedit --wait --resume
set -gx FASTLANE_SKIP_UPDATE_CHECK 1

# Sync universal variables (erase now, build up later)
set -Ue fish_user_paths

# direnv
if type -q direnv
  eval (direnv hook fish)
end

# homebrew ruby
set -p fish_user_paths /usr/local/opt/ruby/bin

# pyenv
if type -q pyenv
  set -gx PYENV_ROOT $HOME/.pyenv
  set -p fish_user_paths $PYENV_ROOT/bin
  if status --is-interactive
    pyenv init - | source
  end
end

# Various bin folders
begin
  set -l gemhome (ruby -r rubygems -e 'puts Gem.user_dir')
  if test -e $gemhome
    set -a fish_user_paths $gemhome/bin
  end
end
if test -e /Applications/Postgres.app
  set -a fish_user_paths /Applications/Postgres.app/Contents/Versions/latest/bin
end

# Abbreviations
if status --is-interactive
  abbr --add bb 'bbedit'
  abbr --add b 'bundle exec'
  abbr --add g 'git'
end

# Local config
set -l local_config_file $HOME/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
