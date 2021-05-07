require 'prime'

class Problem041
  def compute()
    (1..9).flat_map { |n|
        ('1'..n.to_s).to_a.permutation.map { |p|
            p.join('').to_i
        }.select { |i| i.prime? }
    }.max
  end
end
p Problem041.new().compute()
