require 'prime'

primes = []
gen = Prime::EratosthenesGenerator.new
loop do
  p = gen.next
  if p <= 2_000_000
     primes.push(p)
  else
     break
  end
end

p primes.sum

