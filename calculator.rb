# encoding: UTF-8

print "De 1 a 4, selecione a operação desejada [(1) Soma (2) Subtração (3) Multiplicação (4) Divisão]: "

operation = {'1' => :+, '2' => :-, '3' => :*, '4' => :/}[gets.strip]

print "Digite o primeiro algarismo: "

_1st = gets.strip.to_i

print "Digite o segundo algarismo: "

_2nd = gets.strip.to_i

puts "\nSua operação é #{_1st} #{operation.to_s} #{_2nd} e o resultado é #{_1st.send(operation, _2nd)}!"
