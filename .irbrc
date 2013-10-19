require 'rubygems'
# encoding: UTF-8
# It can be interesting to lear these files:
#  /Users/~/.rvm/gems/ruby-1.9.3-p194/gems/wirble-0.1.3/_irbrc
#  /Users/~/.rvm/rubies/ruby-1.9.3-p194/.irbrc

IRB.conf[:PROMPT_MODE] = :SIMPLE

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
 require 'looksee'
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

