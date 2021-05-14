require 'set'

class Problem045
  def compute()
    p = (1..100000).map { |n| n*(3*n-1)/2 }.to_set
    h = (1..100000).map { |n| n*(2*n-1) }.to_set
    
    (286..100000).map { |n| n*(n+1)/2 }.detect { |t|
      p.include?(t) and h.include?(t)
    }
  end
end
p Problem045.new().compute()
