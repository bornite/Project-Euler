class Problem039

  def pythagorean_number?(a, b, c)
    a*a + b*b == c*c
  end
  
  def compute()
    answer = 0
    answer_stack = []
    answer_p = 0
    3.step(1000) do |p|
      stack = []
    
      # a <= b <= c
      1.step((p/3).floor) do |a|
        b = a
        loop do
          c = p-a-b
          if pythagorean_number?(a, b, c)
            stack.push([a, b, c])
          end
    
          b = b + 1
          break if p-a-b < b
        end
      end
    
      if answer < stack.length
        answer = stack.length
        answer_stack = stack
        answer_p = p
      end
    end
    
    puts answer.to_s
    puts answer_stack.to_s
    answer_p.to_s
  end
end
p Problem039.new().compute()
