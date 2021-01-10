def factorial(n)
   n.downto(1).inject(:*)
end

p factorial(100).to_s
p factorial(100).to_s.each_char.inject(0){|sum, i| sum = sum + i.to_i}