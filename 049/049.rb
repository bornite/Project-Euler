require 'prime'

class Problem049
  def get_arithmetic_sequence(range)
    primes = range.select { |n| n.prime? }
    result =  []
    primes.each do |a|
      primes.select { |b| b > a }.each do |b|
        primes.select { |c| c > b }.each do |c|
          if c-b == b-a &&
            a.to_s.split('').sort == b.to_s.split('').sort &&
            b.to_s.split('').sort == c.to_s.split('').sort &&
            c.to_s.split('').sort == a.to_s.split('').sort
            result.push([a, b, c])
          end
        end
      end
    end
    result
  end

  def compute()
    a = get_arithmetic_sequence((1000..9999))
    a[1].inject("") { |answer, x| answer += x.to_s }
  end
end
p Problem049.new().compute()