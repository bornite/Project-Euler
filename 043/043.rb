class Problem043
	def check_divisibility(n, primes)
		(1..7).all? { |i| n[i..i+2].join('').to_i % primes[i-1] == 0
		}
	end

	def compute()
		primes = [2,3,5,7,11,13,17]
		('0'..'9').to_a.permutation.select { |n|
			check_divisibility(n, primes)
		}.map { |digits| digits.join('').to_i }.sum
	end
end
p Problem043.new().compute()