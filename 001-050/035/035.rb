require 'prime'

class Problem035
   def circular(n)
      ret = []
      buf = n
      (n.to_s.length).times do |i|
        buf = rotate(buf)
        ret.push(buf)
      end
      return ret
   end
     
   def rotate(n)
      return n.to_s.slice(1, n.to_s.length-1) + n.to_s.slice(0, 1)
   end
   
   def compute()
      answer = [2]
      3.step(1_000_000, 2) do |i|
         next if !i.prime?
         if circular(i).inject(true) { |sum, j| sum = sum && j.to_i.prime? }
            answer.push(i)
         end
      end
        
      p answer
      answer.length
   end
end
p Problem035.new().compute()
