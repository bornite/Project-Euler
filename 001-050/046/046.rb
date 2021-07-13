require 'set'
require 'prime'

class Problem046
    def get_primes(n)
        (2..n).select { |i| i.prime? }.to_set
    end
    def get_twice_squares(n)
        (0..n).map { |i| 2*(i**2) }.to_set
    end
    def get_odd_composites(n)
        (3..n).select { |i| !(i.prime?) and i.odd? }.to_set
    end

    def compute()
        primes = get_primes(10000)
        twice_squares = get_twice_squares(100)
        odd_composites = get_odd_composites(10000)

        sums = primes.to_a.product(twice_squares.to_a).map { |a,b| a+b }.to_set
        odd_composites.select { |n| !sums.include?(n) }.min
    end
end
p Problem046.new().compute()