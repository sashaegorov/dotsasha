# Алиасы для RVM.
alias rvg='rvm use ruby-2.1.6@global'
alias rvr='rvm use ruby-2.1.6@rails'
alias rvc='rvm current'

# Алиасы для RubGems
alias gel='gem list'
alias geu='gem update'
alias geus='gem update --system'
alias ges='gem search --remote'

# Алиасы для Git
alias gits='git status --short'
alias gitd='git diff'
alias gitdc='git diff --cached'
alias gita='git add'
alias gitai='git add --interactive'
alias giti='git instaweb'
alias gitl='git log'
alias gitlo='git log --oneline'
alias gitla='git log --pretty --stat HEAD^..HEAD'
alias gitck='git checkout'
alias gitc='gitlo --color| head -5;git commit'