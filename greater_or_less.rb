def welcome_player
	puts "Seja bem vindo ao jogo da advinhação."

	puts "Qual é o seu nome?"

	name = gets.strip

	puts "\n\n\n"

	puts "Começaremos um jogo para você, #{name}."

	puts "\n\n\n\n"
end

def choose_number
	puts "Escolhendo um número entre 0 e 200..."

	secret_number = rand(200)

	puts "Escolhido! Que tal advinhar o número?"

	secret_number
end
	
def ask_a_number(attempt, chances, shots)
	puts "Tentativa #{attempt} de #{chances}"
		
	puts "Números tentados: #{shots}"

	puts "Entre com um número: "
		
	answer = gets.strip
		
	puts "Você chutou: #{answer}"
	
	answer
end	

def verification(secret_number, answer)
	right = secret_number == answer.to_i
		
	if right
		puts "Acertou!"
	
		return true
	else
		greater = secret_number > answer.to_i
		
		if greater 
			puts "O número secreto é maior."
		else
			puts "O número secreto é menor."
		end	
		
		false
	end
end

welcome_player

secret_number = choose_number

chances = 5
shots = []
total_points = 1000

for attempt in 1..chances
	shots << answer = ask_a_number(attempt, chances, shots)
	
	lost_points = (answer.to_i - secret_number) / 2.0
	total_points -= lost_points.abs
		
	puts "Você tem #{total_points}."

	break if verification(secret_number, answer)
end
