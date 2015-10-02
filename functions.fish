# Generate nice and secure password
# Example: genpass 32
function -d 'Generate nice and secure password' genpass;
  [ -z $argv ]; or set -l l $argv[1]
  for i in (seq 6)
    gtr -cd 'A-Za-z0-9_!@#$%^&*()_' < /dev/urandom | \
    head -c {$l} | xargs echo
  end
end
