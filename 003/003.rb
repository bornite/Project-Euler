require 'prime'

def largest_prime_factor_of(n) = n.prime_division.map(&:first).max

n = 600851475143
p largest_prime_factor_of(n)
