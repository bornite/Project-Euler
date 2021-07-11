require 'prime'

class Problem007
    def get_nth_prime_number(n) = Prime.take(n).last

    def compute()
        n = 10_001
        get_nth_prime_number(n)
    end
end
p Problem007.new().compute()