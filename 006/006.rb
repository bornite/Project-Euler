class Problem006
   def sum_of_square(n)
      seq = [*1..n]
      seq.map{ |i| i**2 }.sum
   end

   def square_of_sum(n)
      seq = [*1..n]
      (seq.sum)**2
   end

   def compute()
      n = 100
      square_of_sum(n) - sum_of_square(n)
   end
end
p Problem006.new().compute()