require 'prime'

class Problem005
   def hash_of_least_common_multiple(n)
      range = Range.new(1, n)
      result = Hash.new(0)
      range.each do |i|
         array_of_prime_division = i.prime_division

         # Merge the results of prime factorization from 1 to n
         # For each prime factor, we choose the one with the largest exponent.
         array_of_prime_division.each do |a|
            base = a[0]
            exp = a[1]
            result[base] = [exp, result[base]].max
         end
      end
      return result
   end

   def compute_lcm_from_hash(hash_of_prime_division)
      # Create LCM by multiplying each prime factor and exponent
      answer = 1
      hash_of_prime_division.each do |p, e|
      answer = answer * (p ** e)
      end
      return answer
   end

   def compute()
      n = 20
      h = hash_of_least_common_multiple(n)
      compute_lcm_from_hash(h)
   end
end
p Problem005.new().compute()