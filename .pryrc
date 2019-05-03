Pry.config.editor = proc { |file, line| "/Applications/RubyMine.app/Contents/MacOS/rubymine --line #{line} #{file}" }
Pry.config.prompt_name = File.basename(Dir.pwd)
Pry.config.commands.alias_command "!s", "show-source"
Pry.config.prompt = [
  proc { |target, level, pry|
    "#{pry.config.prompt_name}#{'@' + Pry.view_clip(target) unless level.zero? } -> "
  },
  proc { |target, level, pry|
    prompt_length = pry.config.prompt_name.length
    path_length = ('@' + Pry.view_clip(target)).length unless level.zero?
    "#{' ' * (prompt_length + (path_length || 0))} |> "
  }
]

if defined?(BigDecimal)
  BigDecimal.class_eval do
    def inspect
      "#{to_s('+3F')}"
    end
  end
end

=begin
if defined?(Rails) && Rails.env
  require 'logger'

  Rails.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = Logger.new(STDOUT)

  ActiveRecord::Base.clear_active_connections!
end
=end
