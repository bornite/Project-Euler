class Problem057
    def compute
        denominator = [2, 1]
        answer = 0
        1.upto(1000) do |i|
        den = denominator[0]
        elm = denominator.inject(&:+)
        answer += 1 if elm.to_s.length != den.to_s.length
        denominator = [denominator[1]+denominator[0]*2, denominator[0]]
        end
        answer
    end
end
p Problem057.new().compute()