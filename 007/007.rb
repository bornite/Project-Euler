require 'prime'

def get_nth_prime_number(n) = Prime.take(n).last

n = 10_001
p get_nth_prime_number(n)
