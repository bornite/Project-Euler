require 'prime'

class Problem050
    def get_longest_sum_of_consecutive_primes(n)
        primes = Prime.each(1_000_000).to_a
        longest = []

        # Assume that the beginning of the prime number sequence is one of the numbers from 2 to 547.
        primes[0..100].each_with_index { |p, i|
            j = i
            begin
                j += 1
                cons = primes[i..j]
                sum = cons.reduce(:+)
                if sum.prime? && cons.length > longest.length
                    longest = cons
                end
            end while sum < n
        }
        return longest
    end

    def compute()
        n = 1_000_000
        longest = get_longest_sum_of_consecutive_primes(n)
        longest.reduce(:+)
    end
end
p Problem050.new().compute()