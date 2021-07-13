require 'prime'

class Problem047
    def find_four_distinct_prime_factors(limit)
        (1..limit).each_cons(4).detect { |nums| nums.all? { |n| n.prime_division.length == 4 } }
    end

    def compute()
        limit = 1000000
        a = find_four_distinct_prime_factors(limit)
        a[0]
    end
end
p Problem047.new().compute()