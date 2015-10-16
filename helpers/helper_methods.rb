# encoding: UTF-8

def break_line
  puts "\n"
end

def welcome_player
  puts 'Seja bem vindo ao jogo da advinhação.'

  print 'Digite seu nome: '

  name = gets.strip

  break_line

  puts "Começaremos um jogo para você, #{name}."

  if name == 'Chuck Norris'
    puts 'Parabéns, oh senhor supremo do universo. Fizeste todos os pontos possíveis e impossíveis, grande alfa e ômega.'

    exit
  end

  break_line

  name
end

def ask_a_difficulty
  print "De 1 a 5, selecione a difculdade desejada [(1) Muito Fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível]: "

  gets.strip.to_i
end

def choose_number(difficulty)
  max = {'1' => 30, '2' => 60, '3' => 100, '4' => 150, '5' => 200}[difficulty.to_s]

  puts "Escolhendo um número entre 0 e #{max}..."

  secret_number = rand(max) + 1

  puts 'Escolhido! Que tal advinhar o número?'

  break_line

  secret_number
end

def ask_a_number(attempt, chances, shots)
  puts "Tentativa #{attempt} de 5 (Números tentados: #{shots})"

  print 'Entre com um número: '

  while shots.include?(answer = gets.strip.to_i)
    print 'Você já tentou este número. Tente outro: '

    next
  end

  puts "Você chutou o número #{answer}!"

  break_line

  answer
end

def verification(secret_number, answer)
  puts m = if result = secret_number == answer
    'Acertou!'
  else
    "O número secreto é #{secret_number > answer ? 'maior' : 'menor'}!"
  end

  break_line

  result
end

def try_again?
  print 'Você quer jogar novamente? [S/n] '

  input = gets.strip

  input.upcase == 'S' || input == ''
end

def play_with(name, level)
  secret_number = choose_number(level)
  shots         = []
  chances       = 6
  total_points  = 1000

  for attempt in 1..chances
    shots << answer = ask_a_number(attempt, chances, shots)

    if name == 'Leo'
      puts "Acertou!\nVocê tem 1000 pontos."

      break_line

      return true
    end

    lost_points   = (answer - secret_number) / 2.0
    total_points -= lost_points.abs

    puts "Você tem #{total_points} pontos."

    if attempt == 5
      if (secret_number - shots[4]).abs == 1
        puts 'Você errou por 1 e ganhou mais uma chance!'
      else
        break
      end
    end

    return true if verification(secret_number, answer)
  end
  
  puts 'Loser!'
  
  false
end
