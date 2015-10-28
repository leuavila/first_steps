def break_line
  puts "\n"
end

def welcome_player
  puts 'Seja bem vindo ao jogo da forca.'

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

def ask(tries, misses)
  puts "Você tentou as letras #{tries} e tem #{points} pontos até agora"

  break_line

  print "Entre com uma letra ou palavra: "

  try = gets.strip

  puts "Você chutou #{try}."

  break_line

  try
end

# def verification (secret_word, ask)
#   single_word = try.size == 1
# end

def try_again?
  print 'Você quer jogar novamente? [S/n] '

  input = gets.strip

  input.upcase == 'S' || input == ''
end

def play(welcome_player)
  secret_word = choose_word

  tries  = []
  misses = 0
  points = 0

  while misses < 5
    try = ask tries, misses
    tries << try
  end

  single_word = try.size == 1

  if single_word
    # Put something here or review the entire condition...
  else 
    bingo = try == secret_word

    if bingo
      puts 'Acertou mizeravi!'
  
      points += 100
  
      break
    else
      puts "You tried..."

      points -= 30

      misses += 1
    end
  end

  puts "Você fez #{points} pontos !"
end

loop do
  play_with name, level

  break if not try_again?
end
