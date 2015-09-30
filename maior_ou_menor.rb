puts "Seja bem vindo ao jogo da advinhação"
puts "Qual é o seu nome?"
nome = gets
puts "\n\n\n"
puts "Começaremos um jogo para você," + nome
puts "\n\n\n\n"
puts "Escolhendo um número entre 0 e 200..."
numero_secreto = 175
puts "Escolhido! Que tal advinhar o número?"
limite_de_tentativas = 5
for tentativa in 1..limite_de_tentativas
	puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
	puts "Entre com um número"
	chute = gets
	puts "Você chutou:" + chute
#Acertei ou não?
	acertou = numero_secreto == chute.to_i
	if acertou
	puts "Acertou!"
	break
		else
	maior = numero_secreto > chute.to_i
		if maior 
		puts "O número secreto é maior"
		else
		puts "O número secreto é menor"
		end	
	end
end