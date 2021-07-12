require 'prime'

class Problem010
  def get_primes(n)
    primes = []
    gen = Prime::EratosthenesGenerator.new
    loop do
      p = gen.next
      if p <= n
         primes.push(p)
      else
         break
      end
    end
    primes
  end

  def compute()
    primes = get_primes(2_000_000)
    primes.sum
  end
end
p Problem010.new().compute()