# Sync universal variables.
set -qUx COCOAPODS_DISABLE_STATS; or set -Ux COCOAPODS_DISABLE_STATS 'true'
set -qUx EDITOR; or set -Ux EDITOR 'mate -w'
set -qUx FASTLANE_SKIP_UPDATE_CHECK; or set -Ux FASTLANE_SKIP_UPDATE_CHECK '1'
set -qUx PIP_USER; or set -Ux PIP_USER 'yes'

# direnv
if type -q direnv
  eval (direnv hook fish)
end

# Various package managers' bin folders
begin
  set -l gemhome (ruby -r rubygems -e 'puts Gem.user_dir')
  if test -e $gemhome
    set -gx PATH $gemhome/bin $PATH
  end
end
if test -e ~/Library/Python/2.7/bin
  set -gx PATH ~/Library/Python/2.7/bin $PATH
end

# Abbreviations
if status --is-interactive
  abbr --add --global b 'bundle exec'
  abbr --add --global g 'git'
end

# Local config
set -l local_config_file ~/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
