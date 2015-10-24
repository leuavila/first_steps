def factorial(n)
  return 1 if n == 1
  # binding.pry

  factorial(n - 1) * n
end

print 'Entre com um número para descobrir seu fatorial: '

n = gets.strip.to_i

puts "O fatorial de #{n} é #{factorial(n)}"
