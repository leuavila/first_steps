even_numbers = []

for number in 1..50
  even_numbers << number if number % 2 == 0
end

puts even_numbers.join(' ')
