# Atom alias : - )
alias a='atom .'

# RVM aliases
alias rg='rvm use ruby-2.2.3@global'
alias rr='rvm use ruby-2.2.3@rails'
alias rv='rvm current'

# RubyGems aliases
alias gel='gem list'
alias geu='gem update'
alias ges='gem search --remote'
alias geus='gem update --system'

# Git aliases
alias gs='git status --short'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias ga='git add'
alias gai='git add --interactive'
alias gi='git instaweb'
alias gl='git log'
alias glo='git log --oneline'
alias gla='git log --pretty --stat HEAD^..HEAD'
alias gc='gitlo --color| head -5;git commit'

# Bundle aliases
alias bi='bundle install'
alias be='bundle exec'

# Rails 4 aliases
# http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs
alias t='export RAILS_ENV=test; echo -e Rails environment is: ${COLY}${RAILS_ENV}${COLD}'
alias d='export RAILS_ENV=development; echo -e Rails environment is: ${COLG}${RAILS_ENV}${COLD}'
alias p='export RAILS_ENV=production; echo -e Rails environment is: ${BLDR}${RAILS_ENV}${COLD}'

alias rake='spring rake'
alias r='be spring rails'
alias rat='be spring rake -T'
alias rar='be spring rake routes'
alias db='be spring rake db:drop db:create db:migrate'

# Rails logs, tailing and cleaning
alias cdl='> ./log/development.log'
alias ctl='> ./log/test.log'
alias tld='cdl && tail -f ./log/development.log'
alias tlt='ctl && tail -f ./log/test.log'
