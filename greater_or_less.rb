# encoding: UTF-8

require File.expand_path('../helpers/helper_methods.rb', __FILE__)

name  = welcome_player
level = ask_a_difficulty

loop do
  play_with name, level

  break if not try_again?
end
