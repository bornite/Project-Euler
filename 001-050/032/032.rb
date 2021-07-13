class Problem032
   def pandigital?(a, b)
      c = a * b
      check = (a.to_s) + (b.to_s) + (c.to_s)
      if check.each_char.sort.join == "123456789"
          return true
      else
          return false
      end
   end
   
   def compute()
      result = (1..4999).to_a.product((1..99).to_a).filter do |a, b|
          pandigital?(a, b)
      end
      result.map {|a,b| a*b }.uniq.sum
   end
end
