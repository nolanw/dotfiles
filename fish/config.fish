set -gx COCOAPODS_DISABLE_STATS true
set -gx EDITOR bbedit --wait --resume
set -gx FASTLANE_SKIP_UPDATE_CHECK 1
set -gx PIP_USER yes

# Sync universal variables (erase now, build up later)
set -Ue fish_user_paths

# direnv
if type -q direnv
  eval (direnv hook fish)
end

# homebrew ruby
set -p fish_user_paths /usr/local/opt/ruby/bin

# Various bin folders
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
  abbr --add bb 'bbedit'
  abbr --add b 'bundle exec'
  abbr --add g 'git'
end

# Local config
set -l local_config_file ~/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
