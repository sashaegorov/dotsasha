# Preclean
for a in (abbr --list); abbr --erase $a; end

# First attempt to move abbliases to Fish
function abblias
  alias $argv
  abbr --add $argv
end

function dotsasha_alases -d 'Add all aliases'
  # Atom
  abblias a "atom ."

  # RubyGems
  abblias gel "gem list"
  abblias geu "gem update"
  abblias geus "gem update --system"

  # Git
  abblias ga "git add -A ."
  abblias gp "git pull"
  abblias gc "git checkout"
  abblias gd "git diff"
  abblias gdc "git diff --cached"
  abblias gds "git diff --stat"
  abblias gf "git fetch --all --prune"
  abblias gl "git log"
  abblias gla "git log --pretty --stat HEAD^..HEAD"
  abblias glo "git log --oneline"
  abblias gs "git status --short"

  # Node/npm/nvm
  abblias nu "nvm use"
  abblias nv "node -v"
  abblias nr "npm run"
  abblias ni "npm install"
  abblias nri "npm cache clean --force; and npm install"

  # Bundler
  abblias bi "bundle install"
  abblias be "bundle exec"

  abblias rd "rspec -f d"
  abblias ro "rspec --only-failures"
  abblias rf "rspec --next-failure"
  abblias ra "rake -T --all | less"
  abblias rr "rake routes"
  abblias rt "rake db:drop db:create db:migrate RAILS_ENV=test"
  abblias m "rake db:migrate"
end

dotsasha_alases
