class Problem055
    def palindromic_num?(num)
        return true if num.to_s == num.to_s.reverse
        false
    end
    
    def sum_up_with_reverse(num)
        num + num.to_s.reverse.to_i
    end
    
    def lychrel?(num)
        buf = num
        49.times do |i|
        return false if palindromic_num?(buf = sum_up_with_reverse(buf))
        end
        true
    end
    
    def compute()
        answer = 0
        1.upto(9999) do |i|
            answer += 1 if lychrel?(i)
        end
        answer
    end
end
p Problem055.new().compute()