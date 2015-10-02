def welcome_player
	puts "Seja bem vindo ao jogo da advinhação."

	puts "Qual é o seu nome?"

	name = gets

	puts "\n\n\n"

	puts "Começaremos um jogo para você," + name + "."

	puts "\n\n\n\n"
end

def choose_number
	puts "Escolhendo um número entre 0 e 200..."

	secret_number = 175

	puts "Escolhido! Que tal advinhar o número?"

	secret_number
end
	
def ask_a_number(attempt, chances)
	puts "Tentativa " + attempt.to_s + " de " + chances.to_s + "."
		
	puts "Entre com um número:"
		
	answer = gets
		
	puts "Você chutou:" + answer + "."
	
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

for attempt in 1..chances
	answer = ask_a_number(attempt, chances)
	
	break if verification(secret_number, answer)
end
