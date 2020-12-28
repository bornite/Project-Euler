def sum_of_even_fibonacci_seq(limit)
  fib = [1, 2]
  loop do
    n = fib[-2..-1].sum
    break if n > limit
    fib << n
  end
  p fib
  fib.select{ |n| n%2 == 0 }.sum
end

limit = 4_000_000
p sum_of_even_fibonacci_seq(limit)
