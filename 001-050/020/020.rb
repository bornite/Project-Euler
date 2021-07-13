class Problem020
   def factorial(n)
      n.downto(1).inject(:*)
   end

   def compute()
      p factorial(100).to_s
      factorial(100).to_s.each_char.inject(0){|sum, i| sum = sum + i.to_i}
   end
end
p Problem020.new().compute()