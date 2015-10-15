# encoding: UTF-8

require 'rubygems'
require 'pry'

require File.expand_path('../helpers/helper_methods.rb', __FILE__)

name  = welcome_player
level = ask_a_difficulty
count = {
  hits:  0.0,
  tries: 0.0
}

loop do
  count[:hits] += 1 if play_with name, level

  count[:tries] += 1

  break if not try_again?
end
#binding.pry
puts "Fim de jogo. Seu aproveitamento é #{count[:hits].to_i}/#{count[:tries].to_i} (#{(count[:hits] / count[:tries]) * 100.0}%)!"
