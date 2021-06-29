require 'prime'

class Problem086
    def square?(n)
        (Math.sqrt(n).floor)**2 == n
    end

    def divisors(n)
        divisors = [1]
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

    def compute()
        count = 0
        max = 1
        origins = []
        loop do
        max += 1
        count_base = origins.select{ |a| max%a[0]==0 }.map{ |a| [max, a[1]*(max/a[0])] }
        count_base.map do |a|
            a[1] < a[0] ? (a[1]/2.0).floor : (a[1]/2.0).floor-(a[1]-a[0])+1
        end
        count_base.each do |a|
            count += (a[1] < a[0] ? (a[1]/2.0).floor : (a[1]/2.0).floor-(a[1]-a[0])+1)
            p "max: #{a[0]}, min+mid: #{a[1]}, patterns: #{(a[1] < a[0] ? (a[1]/2.0).floor : (a[1]/2.0).floor-(a[1]-a[0])+1)}"
        end
        if max%2 == 0 # maxが偶数
            divisors(max/2).each do |n|
            m = max/(2*n)
            break if n > m
            a = m**2 - n**2
            next if a > max*2 || a == 0 || count_base.include?([max, a])
            p "max: #{max}, min+mid: #{a}, patterns: #{(a < max ? (a/2.0).floor : (a/2.0).floor-(a-max)+1)}"
            count += (a < max ? (a/2.0).floor : (a/2.0).floor-(a-max)+1)
            origins << [max, a]
            end
        else # maxが奇数
            divisors(max).each do |minus|
            plus = max/minus
            break if minus > plus
            b = (plus+minus)*(plus-minus)/2
            next if b > max*2 || b == 0 || count_base.include?([max, b])
            p "max: #{max}, min+mid: #{b}, patterns: #{(b < max ? (b/2.0).ceil : (b/2.0).floor-(b-max)+1)}"
            count += (b < max ? (b/2.0).ceil : (b/2.0).floor-(b-max)+1)
            origins << [max, b]
            end
        end
        p "max: #{max}, count: #{count}"
        break if count > 1000000
        end
        return max
    end
end
p Problem086.new().compute()