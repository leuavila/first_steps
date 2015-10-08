def break_line
  puts "\n"
end

def welcome_player
  puts "Seja bem vindo ao jogo da advinhação."

  print "Digite seu nome: "

  name = gets.strip

  break_line

  puts "Começaremos um jogo para você, #{name}."

  break_line
end

def choose_number(difficulty)
  max = {'1' => 30, '2' => 60, '3' => 100, '4' => 150}[difficulty.to_s]

  puts "Escolhendo um número entre 0 e #{max}..."

  secret_number = rand(max) + 1

  puts "Escolhido! Que tal advinhar o número?"

  break_line

  secret_number
end

def ask_a_number(attempt, chances, shots)
  puts "Tentativa #{attempt} de #{chances} (Números tentados: #{shots})"

  print "Entre com um número: "

  answer = gets.strip.to_i

  puts "Você chutou o número #{answer}!"

  break_line

  answer
end

def verification(secret_number, answer)
  puts message = if result = secret_number == answer
    "Acertou!"
  else
    "O número secreto é #{secret_number > answer ? 'maior' : 'menor'}!"
  end

  break_line

  result
end

def difficulty
  print "De 1 a 5, selecione a difculdade desejada: "

  level = gets.strip.to_i
end

welcome_player

level         = difficulty
secret_number = choose_number(level)
shots         = []
chances       = 5
total_points  = 1000

for attempt in 1..chances
  shots << answer = ask_a_number(attempt, chances, shots)

  lost_points   = (answer - secret_number) / 2.0
  total_points -= lost_points.abs
    
  puts "Você tem #{total_points} pontos."

  break if verification(secret_number, answer)
end
