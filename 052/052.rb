class Problem052
    def check_same_digits(a, b)
        if a.to_s.each_char.sort.join == b.to_s.each_char.sort.join
            return true
        else
            return false
        end
    end

    def compute()
        n = 1
        loop do
            n += 1
            next if n.to_s.length != (6*n).to_s.length
            next unless check_same_digits(n, 2*n)
            next unless check_same_digits(n, 3*n)
            next unless check_same_digits(n, 4*n)
            next unless check_same_digits(n, 5*n)
            next unless check_same_digits(n, 6*n)
            break
        end
        return n
    end
end
p Problem052.new().compute()