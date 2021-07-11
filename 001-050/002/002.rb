class Problem002
	def sum_of_even_fibonacci_seq(limit)
		fib = [1, 2]
		loop do
			n = fib[-2..-1].sum
			break if n > limit
			fib << n
		end
		fib.select{ |n| n%2 == 0 }.sum
	end

	def compute()
		limit = 4_000_000
		sum_of_even_fibonacci_seq(limit)
	end
end
p Problem002.new().compute()
