# Dotfiles for Fish

## Load aliases
Add this to `.config/fish/config.fish`:
```
# Load aliases
. $HOME/.dotsasha/aliases.fish
. $HOME/.dotsasha/functions.fish
```

## Functions
Here is the list of some user-friendly functions.
- `dotsasha_alases` adds all aliases to Fish, normally should be done once

### Color related functions
- `color256` draws 256-color palette in your terminal, this may help to check 256-color support
- `color16` draws 16-color palette of [ANSI-color](https://en.wikipedia.org/wiki/ANSI_escape_code) foregrounds and backgrounds
