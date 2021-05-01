class Problem023
  def get_divisors(n)
      result = []
      (1..n-1).each do |x|
         if n % x == 0
           result.push(x)
         end
      end
      result
  end
   
  def abundant?(x)
     sum_of_divisors_x = get_divisors(x).sum
     if sum_of_divisors_x > x
        return true
     else
        return false
     end
  end

  def get_written_as_sum_of_two_abundant_numbers
      abundant_numbers = []
      abundant_numbers = (1..28123).select { |n| abundant?(n) }
      i = 0
      sums = []
      abundant_numbers.each do |x|
          abundant_numbers[i..abundant_numbers.length].each do |y|
          sum = x + y
          sums.push(sum) unless sum > 28123
        end
        i += 1
      end
      sums.uniq!
      return sums        
  end

  def compute()
    sum_of_two_abundant_numbers = get_written_as_sum_of_two_abundant_numbers()
    (1..28123).reject{ |n| sum_of_two_abundant_numbers.include?(n) }.reduce(:+)
  end
end
p Problem023.new().compute()