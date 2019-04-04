set -gx COCOAPODS_DISABLE_STATS true
set -gx EDITOR vi
set -gx FASTLANE_SKIP_UPDATE_CHECK 1
set -gx PIP_USER yes

# direnv
if type -q direnv
  eval (direnv hook fish)
end

# homebrew ruby
set -gx PATH /usr/local/opt/ruby/bin $PATH

# Sync various package managers' and utilities' bin folders (erase each run so it's consistent after updating dotfiles)
set -Ue fish_user_paths
begin
  set -l gemhome (ruby -r rubygems -e 'puts Gem.user_dir')
  if test -e $gemhome
    set -a fish_user_paths $gemhome/bin
  end
end
if test -e ~/Library/Python/2.7/bin
  set -a fish_user_paths ~/Library/Python/2.7/bin
end
if test -e /Applications/Postgres.app
  set -a fish_user_paths /Applications/Postgres.app/Contents/Versions/latest/bin
end

# Abbreviations
if status --is-interactive
  abbr --add b 'bundle exec'
  abbr --add g 'git'
end

# Local config
set -l local_config_file ~/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
