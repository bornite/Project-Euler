class Problem074
    def factorial(n)
        return 1 if [0,1].include?(n)
        n*factorial(n-1)
    end
    
    def sum_of_factorial_of_each_digit(n)
        n.to_s.split('').map(&:to_i).map{ |m| @fac[m] }.inject(&:+)
    end
    
    def compute()
        @fac = [*0..9].map{ |n| factorial(n) }
        h = {}
        @fac.each_with_index{ |n, i| h[i] = n }
        
        answer = 0
        
        10.upto(999999) do |n|
            chain = [n]
            m = n
            loop do
            h[m] = sum_of_factorial_of_each_digit(m) unless h.has_key?(m)
            m = h[m]
            break if chain.include?(m)
            chain.push(m)
            end
            if chain.length == 60
            answer += 1
            # p chain
            end
        end
        answer
    end
end
p Problem074.new().compute()