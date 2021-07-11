require 'prime'

class Problem003
	def largest_prime_factor_of(n) = n.prime_division.map(&:first).max

	def compute()
		n = 600851475143
		largest_prime_factor_of(n)
	end
end
p Problem003.new().compute()
