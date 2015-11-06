# encoding: UTF-8

# require 'rubygems'
# require 'pry'

$tries  = []
$score  = 0
$misses = 0

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

  shot = gets.strip

  puts "Você chutou #{shot}!"

  break_line

  shot
end

def refresh_stats!(miss, score)
  $misses += 1 if miss

  $score += score
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

    refresh_stats!(false, 10)
  else
    puts "Letra não encontrada!"

    refresh_stats!(true, -10)
  end

  found  
end

def verifying_word(secret_word, word_tried)
  if result = secret_word == word_tried
    refresh_stats!(false, 100)
  else
    refresh_stats!(true, -100)
  end

  result
end

def letter_or_word(secret_word, shot)
  if shot.size == 1
    verifying_letters(secret_word, shot)
  else
    verifying_word(secret_word, shot)

    throw :test
  end
end  

def try_again?
  print 'Você quer jogar novamente? [S/n] '

  input = gets.strip

  input.upcase == 'S' || input == ''
end

def play!
  secret_word = choose_word

  catch :test do
    while $misses < 5
      $tries << shot = ask($tries, $score)

      letter_or_word(secret_word, shot)
    end
  end
  
  puts "Você fez #{$score} pontos!"
end

welcome_player

loop do
  play!

  break if not try_again?
end

