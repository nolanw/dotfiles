# Sync universal variables.
set COCOAPODS_DISABLE_STATS true
set -qUx EDITOR; or set -Ux EDITOR 'mate -w'

# direnv
eval (direnv hook fish)

# Various package managers' bin folders
set PATH (ruby -rubygems -e 'puts Gem.user_dir')/bin ~/Library/Python/2.7/bin $PATH
