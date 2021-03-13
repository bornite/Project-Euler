require 'prime'

class Problem060
def get_primes_under(n)
    arr = [*2..n]
    limit = Math.sqrt(n).floor
    p = 2
    used_p = []
  
    while(p < limit)
      arr = arr.reject{ |i| i != p && i % p == 0 }
      used_p.push(p)
      p = (arr - used_p).first
    end
    return arr
  end
  
  def prime_pair?(p1, p2)
    combi_1 = (p1.to_s + p2.to_s).to_i
    combi_2 = (p2.to_s + p1.to_s).to_i
    return false if !(combi_1.prime? && combi_2.prime?)
    true
  end
  
  def compute()
    n = 10000
    count = 0
    answer = 0
    
    primes = get_primes_under(n)
    prime_pair_set = primes.combination(2).to_a.select { |a| prime_pair?(a[0], a[1]) }
    
    2.upto(4) do |size|
        next_set = []
        prime_pair_set.each do |combi|
            primes.each do |p|
                next if combi.include?(p)
                
                next_flg = false
                combi.each do |q|
                    if !prime_pair?(p, q)
                        next_flg = true
                        break
                    end
                end
                next if next_flg
                next if next_set.include?((combi+[p]).sort)
                next_set.push(combi.dup.push(p).sort)
            end
        end
    
        next_set_sum = []
        next_set.each{ |arr| next_set_sum.push(arr.inject(:+)) }
        prime_pair_set = next_set
        answer = next_set_sum.min
        p answer
    end
    return answer
  end
end
p Problem060.new().compute()
