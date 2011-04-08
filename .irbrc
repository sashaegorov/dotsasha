require 'rubygems'

IRB.conf[:PROMPT_MODE] = :DEFAULT

begin # Interactive editor
  require 'interactive_editor'
  rescue LoadError => error
    $stderr.puts "Couldn't load Interactive editor: #{error}"
end

begin # Wirble
  require 'wirble'
  Wirble.init
  Wirble.colorize
  rescue LoadError => error
    $stderr.puts "Couldn't load Wirble: #{error}"
end

begin # Looksee
  require 'looksee/shortcuts'
  rescue LoadError => error
    $stderr.puts "Couldn't load Looksee: #{error}"
end

begin # Awesome Print
  require 'awesome_print'
  rescue LoadError => error
    $stderr.puts "Couldn't load Awesome Print: #{error}"
end

begin # Hirb
  require 'hirb'
  Hirb.enable :pager_command => 'less -R'
  rescue LoadError => error
    $stderr.puts "Couldn't load Hirb: #{error}"
end

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# require 'rdoc/ri/driver'
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

alias q exit

