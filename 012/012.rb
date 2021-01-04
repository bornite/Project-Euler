require 'prime'

def get_num_of_divisors(n)
  n.prime_division.map(&:last).map{ |n| n+1 }.inject(:*)
end

def get_first_triangular_number_to_have_divisors_over_limit(limit)
    n = 2
    loop do
       triangular_number = n*(n+1)/2
       break if get_num_of_divisors(triangular_number) > limit
       n += 1
    end
    return n*(n+1)/2
end

limit = 500
p get_first_triangular_number_to_have_divisors_over_limit(limit)