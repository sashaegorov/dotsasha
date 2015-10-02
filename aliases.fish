# First attempt to move abbliases to Fish

function abblias
  alias $argv
  abbr -a $argv
end

function -d 'Add all aliases' dotsasha_alases
  # Atom
  abblias "a=atom ."

  # RVM
  abblias "rg=rvm use ruby-2.2.3@global"
  abblias "rr=rvm use ruby-2.2.3@rails"
  abblias "rv=rvm current"

  # RubyGems
  abblias "gel=gem list"
  abblias "ges=gem search --remote"
  abblias "geu=gem update"
  abblias "geus=gem update --system"

  # Git
  abblias "gs=git status --short"
  abblias "gd=git diff"
  abblias "gdc=git diff --cached"
  abblias "gds=git diff --stat"
  abblias "ga=git add"
  abblias "gai=git add --interactive"
  abblias "gi=git instaweb"
  abblias "gf=git fetch"
  abblias "gfa=git fetch --all"
  abblias "gl=git log"
  abblias "glo=git log --oneline"
  abblias "gla=git log --pretty --stat HEAD^..HEAD"
  abblias "gc=glo --color| head -5;git commit"

  # Bundler
  abblias "bi=bundle install"
  abblias "be=bundle exec"

  # Rails 4 aliases
  # http://matthewhutchinson.net/2010/9/19/rails-3-bash-aliases-and-irbrc-configs
  # TODO: Make it some how better.
  function __dotsasha_rails_env -v RAILS_ENV
    echo -n 'RAILS_ENV set to: '
    switch $RAILS_ENV
      case "development"
        set_color green
      case "test"
        set_color yellow
      case "production"
        set_color red
      case "*"
        echo Unknown RAILS_ENV environment
    end
    echo $RAILS_ENV
    set_color normal
  end
  # Sorry `ed`. Nobody uses you.
  abblias "ed=set -xg RAILS_ENV development"
  abblias "et=set -xg RAILS_ENV test"
  abblias "ep=set -xg RAILS_ENV production"

  # TODO: Make it functions
  # Most of these works only if Gemfile present in current directory
  abblias "r=bundle exec spring rails"
  abblias "f=bundle exec spring foreman"
  abblias "rake=bundle exec spring rake"
  abblias "rat=bundle exec spring rake -T --all | less"
  abblias "rar=bundle exec spring rake routes"
  abblias "rad=bundle exec spring rake db:drop db:create db:migrate"
  # Rails logs, tailing and cleaning
  abblias "cdl=cat /dev/null > ./log/development.log"
  abblias "ctl=cat /dev/null > ./log/test.log"
  abblias "tld=cdl; and tail -f ./log/development.log"
  abblias "tlt=ctl; and tail -f ./log/test.log"
end
