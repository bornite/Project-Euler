class Problem063
  def compute()
    n = 1
    answer = 0
    loop do
      break if (9**n).to_s.length < n
      p "n = #{n}, length of 9^n = #{(9**n).to_s.length}" # 2^n = #{2**n}, 
      i = 1
      loop do
        check = (i**n).to_s
        break if check.length > n
        if check.length == n
          p "#{i}^#{n} = #{check}"
          answer += 1
        end
        i += 1
      end
      n += 1
    end
    answer
  end
end
p Problem063.new().compute()