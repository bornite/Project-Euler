require 'prime'

class Problem069
    def totient(n)
        return n-1 if n.prime?

        ret = n
        prime_factors = n.prime_division()
        prime_factors.each do |p|
          ret = ret*(p[0]-1)/p[0]
        end
        ret
    end

    def n_divided_by_totient(n)
        return n.to_f/totient(n)
    end

    def compute()
        limit = 1_000_000
        answer = 0
        max = 0
        2.upto(limit) do |n|
            result = n_divided_by_totient(n)
            if result > max
                max = result
                answer = n
            end
        end
        answer
    end
end
p Problem069.new().compute()