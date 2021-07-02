require 'prime'

class Problem087
  def compute()
    max = 50000000
    primes = [
      Prime.each((max**(1/2.0)).floor.to_i).to_a,
      Prime.each((max**(1/3.0)).floor.to_i).to_a,
      Prime.each((max**(1/4.0)).floor.to_i).to_a
    ]
    answers = []
    primes[0].each do |square|
      primes[1].each do |cubic|
        primes[2].each do |biquadratic|
          val = square**2 + cubic**3 + biquadratic**4
          answers << val if val < max
        end
      end
    end
    answers.uniq.length
  end
end
p Problem087.new().compute()
