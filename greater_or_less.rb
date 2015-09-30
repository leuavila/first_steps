puts "Seja bem vindo ao jogo da advinhação."

puts "Qual é o seu nome?"

name = gets

puts "\n\n\n"

puts "Começaremos um jogo para você," + name + "."

puts "\n\n\n\n"

puts "Escolhendo um número entre 0 e 200..."

secret_number = 175

puts "Escolhido! Que tal advinhar o número?"

chances = 5

for attempt in 1..chances
	puts "Tentativa " + attempt.to_s + " de " + chances.to_s "."
	
	puts "Entre com um número:"
	
	answer = gets
	
	puts "Você chutou:" + answer + "."

	right = secret_number == answer.to_i

	if right
		puts "Acertou!"
	
		break
	else
		greater = secret_number > answer.to_i
		
		if greater 
			puts "O número secreto é maior."
		else
			puts "O número secreto é menor."
		end	
	end
end
