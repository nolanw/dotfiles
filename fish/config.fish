# Sync universal variables.
set -qUx COCOAPODS_DISABLE_STATS; or set -Ux COCOAPODS_DISABLE_STATS 'true'
set -qUx EDITOR; or set -Ux EDITOR 'mate -w'

# direnv
eval (direnv hook fish)

# Various package managers' bin folders
set -U fish_user_paths (ruby -rubygems -e 'puts Gem.user_dir')/bin ~/Library/Python/2.7/bin /Applications/Postgres.app/Contents/Versions/latest/bin $fish_user_paths

# Local config
set -l local_config_file ~/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
