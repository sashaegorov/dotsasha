# Generate nice and secure password
# Example: genpass 32
function -d 'Generate nice and secure password' genpass;
  [ -z $argv ]; and set -l l 16
  for i in (seq 5)
    gtr -cd 'A-Za-z0-9_!@#$%^&*()_' < /dev/urandom | \
    head -c {$l} | xargs echo
  end
end
