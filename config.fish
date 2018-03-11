# Add custom bin path
set -U fish_user_paths $HOME/.bin $fish_user_paths

set -g theme_display_git_ahead_verbose yes
set -g theme_title_display_process yes
set -g theme_date_format "+%H:%M"
set -g theme_display_vagrant yes
set -g theme_display_ruby yes
set -g theme_color_scheme terminal-dark
set -g theme_project_dir_length 1

# nvm Integration
test -s ~/.nvm-fish/nvm.fish;
and source ~/.nvm-fish/nvm.fish

# Load fishmarks (http://github.com/techwizrd/fishmarks)
. ~/.fishmarks/marks.fish

# Load aliases
. ~/.dotsasha/aliases.fish
. ~/.dotsasha/functions.fish

# rbenv Integration
status --is-interactive; and . (rbenv init -|psub)

# iTerm Integration
test -e {$HOME}/.iterm2_shell_integration.fish;
and source {$HOME}/.iterm2_shell_integration.fish


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sashaegorov/.bin/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/sashaegorov/.bin/google-cloud-sdk/path.fish.inc'; else; . '/Users/sashaegorov/.bin/google-cloud-sdk/path.fish.inc'; end; end
