require 'rubygems'
# encoding: UTF-8

IRB.conf[:PROMPT_MODE] = :SIMPLE

begin # Wirble
 require 'wirble'
  Wirble.init
  Wirble.colorize
  rescue LoadError => error
    $stderr.puts "Couldn't load Wirble: #{error}"
end

begin # Looksee
 require 'looksee' unless RUBY_ENGINE == 'jruby'
  rescue LoadError => error
    $stderr.puts "Couldn't load Looksee: #{error}"
end

begin # Awesome Print
  require 'awesome_print'
  rescue LoadError => error
    $stderr.puts "Couldn't load Awesome Print: #{error}"
  AwesomePrint.irb!
end

begin # Hirb
  require 'hirb'
  Hirb.enable :pager_command => 'less -R'
  rescue LoadError => error
    $stderr.puts "Couldn't load Hirb: #{error}"
end

alias q exit
