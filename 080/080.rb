require 'bigdecimal'
require 'bigdecimal/math'

class Problem080
  def square?(n)
    (Math.sqrt(n).floor)**2 == n
  end

  def compute()
    sum = 0
    2.upto(99) do |i|
      next if square?(i)
      sum += BigMath::sqrt(BigDecimal(i), 90).to_s[2..-3][0..99].split('').map(&:to_i).inject(:+)
    end
    sum
  end
end