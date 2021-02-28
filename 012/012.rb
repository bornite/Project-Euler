require 'prime'

class Problem012
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

  def compute()
    limit = 500
    get_first_triangular_number_to_have_divisors_over_limit(limit)
  end
end
p Problem012.new().compute()