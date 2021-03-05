class Problem056
    def sum_of_digits(num)
        num.to_s.split('').map(&:to_i).inject(&:+)
    end

    def compute()
        answer = 0
        (1..100).to_a.product((1..100).to_a).map do |a,b|
            buf = sum_of_digits(a**b)
            answer = (answer < buf ? buf : answer)
        end
        answer
    end
end
p Problem056.new().compute()