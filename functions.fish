# Generate nice and secure password
# Example: genpass 32
function genpass -d 'Generate nice and secure password';
  if [ -z $argv ]
    set -g l 16;
  else
    set -g l $argv;
  end
  for i in (seq 5)
    gtr -cd 'A-Za-z0-9_!@#$%^&*()_' < /dev/urandom | \
    head -c {$l} | xargs echo
  end
end

function rails
  if test -f bin/rails
    bin/rails $argv
  else if test -f Gemfile
    bundle exec rails $argv
  else
    command rails $argv
  end
end

function rake
  if test -f bin/rake
    bin/rake $argv
  else if test -f Gemfile
    bundle exec rake $argv
  else
    command rake $argv
  end
end

function rspec
  if test -f bin/rspec
    bin/rspec $argv
  else if test -f Gemfile
    bundle exec rspec $argv
  else
    command rspec $argv
  end
end
