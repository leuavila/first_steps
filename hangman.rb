# encoding: UTF-8

require 'rubygems'
require 'pry'

def break_line
  puts "\n"
end

def welcome_player
  puts 'Seja bem vindo ao jogo da forca!'

  print 'Digite seu nome: '

  name = gets.strip

  break_line

  puts "Começaremos um jogo para você, #{name}."

  break_line

  name
end

def choose_word
  puts 'Escolhendo a palavra...'

  secret_word = 'programador'

  puts "A palavra secreta foi escolhida e tem #{secret_word.size} letras. Boa sorte!"

  break_line

  secret_word
end

def ask(tries, score)
  puts "Você tentou as letras #{tries} e tem #{score} pontos até agora!"

  break_line

  print "Entre com uma letra ou palavra: "

  letter = gets.strip

  puts "Você chutou #{letter}!"

  break_line

  letter
end

def verifying_letters(secret_word, letter_tried)
  found = false

  for i in 0..(secret_word.size - 1)
    if secret_word[i] == letter_tried
      found = true
      break
    end
  end

  if found
    puts 'Letra encontrada!'
  else
    puts "Letra não encontrada!"
  end

  found  
end

def try_again?
  print 'Você quer jogar novamente? [S/n] '

  input = gets.strip

  input.upcase == 'S' || input == ''
end

def play!
  secret_word = choose_word

  tries  = []
  misses = 0
  score  = 0

  while misses < 5
    tries << letter_tried = ask(tries, score)

    if verifying_letters(secret_word, letter_tried)
      score += 1
    else
      misses += 1
    end
  end

  puts "Você fez #{score} pontos!"
end

welcome_player

loop do
  play!

  break if not try_again?
end
