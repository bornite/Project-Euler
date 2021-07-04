require 'prime'

class Problem088
    def divisors(n)
        divisors = []
        primes = []
        n.prime_division.each do |prime|
            prime[1].times {primes << prime[0]}
        end

        1.upto(primes.size) do |i|
            primes.combination(i) do |prime|
                divisors << prime.inject{|a,b| a *= b}
            end
        end
        divisors.uniq!
        divisors.sort!
        return divisors
    rescue ZeroDivisionError
        return
    end

    def products(n)
        return [[]] if n == 1
        ret = []
        divisors(n).each do |d|
            products(n/d).map{ |prd| [d, prd].flatten }.each{ |a| ret << a }    
        end
        ret.map(&:sort).uniq
    end

    def compute()
        arr = [nil, nil]
        max = 12000
        n = 3
        loop do
            n += 1
            next if n.prime?

            pds = products(n)
            pds.each do |pd|
                k = pd.length+(n-pd.sum)
                if arr[k].nil? && k <= max
                    arr[k] = n
                    p pd
                    p "arr[#{k}] = #{n}"
                end
            end
            break if arr.length == max+1 && !arr[2..max].include?(nil)
        end
        p arr[2..max].uniq
        arr[2..max].uniq.sum
    end
end
p Problem088.new().compute()