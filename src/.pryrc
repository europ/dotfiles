if defined?(Pry)
  require 'pry-byebug'
  require 'awesome_print'

  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
end
