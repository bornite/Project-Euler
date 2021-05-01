class Problem021
   def get_divisors(n)
      result = []
      (1..n-1).each do |x|
         if n % x == 0
         result.push(x)
         end
      end
      result
   end

   def is_amicable(x)
      sum_of_divisors_x = get_divisors(x).sum
      if sum_of_divisors_x == x
         return false
      end
      if get_divisors(sum_of_divisors_x).sum == x
         return true
      else
         return false
      end
   end

   def compute()
      amicable_numbers = []
      (1..10000).each do |n|
         if is_amicable(n)
            amicable_numbers.push(n)
         end
      end
      p amicable_numbers
      amicable_numbers.sum
   end
end
p Problem021.new().compute()