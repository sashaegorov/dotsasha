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
