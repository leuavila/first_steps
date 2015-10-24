# encoding: UTF-8

def factorial(n)
  return 1 if n == 1

  factorial(n - 1) * n
end

print 'Entre com um número para descobrir seu fatorial: '

n = gets.strip.to_i

puts "\nO fatorial de #{n} é #{factorial(n)}!"
