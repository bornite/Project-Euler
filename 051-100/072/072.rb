require 'prime'

class Problem072
  def totient(n)
    return n-1 if n.prime?

    ret = n
    prime_factors = n.prime_division()
    prime_factors.each do |p|
      ret = ret*(p[0]-1)/p[0]
    end
    ret
  end

  def compute()
    max = 1000000
    [*2..max].map { |n| totient(n) }.inject(:+)
  end
end
p Problem072.new().compute()