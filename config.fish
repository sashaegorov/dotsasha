test -s ~/.nvm-fish/nvm.fish; and source ~/.nvm-fish/nvm.fish
# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf
# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
# Load fishmarks (http://github.com/techwizrd/fishmarks)
. $HOME/.fishmarks/marks.fish
# Load aliases
. $HOME/.dotsasha/aliases.fish
. $HOME/.dotsasha/functions.fish

set -g theme_display_git_ahead_verbose yes
set -g theme_date_format "+%a %H:%M"
set -g theme_display_ruby auto
set -g theme_display_ruby_format g

set -g theme_display_vagrant yes
