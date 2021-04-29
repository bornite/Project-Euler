require 'prime'

class Problem070
    def primes(max)
        ret = []
        Prime.each(max/2){ |p| ret.push(p) }
        ret
    end

    def permutation?(n, m)
        return false if n.to_s.length != m.to_s.length
        arr = m.to_s.split('')
        n.to_s.split('').each do |d|
            idx = arr.index(d)
            return false if idx.nil?
            arr.delete_at(idx)
        end
        arr == []
    end

    def compute()
        max = 10**7
        answer_f = max
        answer = 1
        primes = Prime::EratosthenesGenerator.new.take(Math.sqrt(max).floor/2)
        combi_primes = primes.combination(2).to_a.select{ |a| a.inject(:*) < max }

        combi_primes.each do |combi|
            pp = combi.inject(:*) # primes_product
            t = combi.inject{ |p, q| (p-1)*(q-1) }
            f = pp/t.to_f
            next if answer_f < f
            next unless permutation?(pp, t)
            if f < answer_f
                p "combi = #{combi}, pp = #{pp}, t = #{t}, f = #{f}"
                answer_f = f
                answer = pp
            end
        end
        answer
    end
end
p Problem070.new().compute()