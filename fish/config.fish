# Sync universal variables.
set -qUx COCOAPODS_DISABLE_STATS; or set -Ux COCOAPODS_DISABLE_STATS 'true'
set -qUx EDITOR; or set -Ux EDITOR 'mate -w'
set -qUx FASTLANE_SKIP_UPDATE_CHECK; or set -Ux FASTLANE_SKIP_UPDATE_CHECK '1'
set -qUx PIP_USER; or set -Ux PIP_USER 'yes'

# direnv
eval (direnv hook fish)

# Various package managers' bin folders
set -gx PATH ~/.gem/ruby/2.3.0/bin ~/Library/Python/2.7/bin $PATH

# Abbreviations
abbr b='bundle exec'
abbr g='git'

# Local config
set -l local_config_file ~/.local_config.fish
if test -f $local_config_file
  source $local_config_file
end
