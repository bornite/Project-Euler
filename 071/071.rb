class Problem071
  def hcf(n, m)
    if m < n
      buf = m
      m = n
      n = buf
    end
    return n if m%n == 0
    hcf(m%n, n)
  end

  def compare_with_frac(base_frac, frac)
    n = frac[0]*base_frac[1]
    compared_n = base_frac[0]*frac[1]

    return 0 if n == compared_n
    n-compared_n > 0 ? 1 : -1
  end

  def compute()
    max = 1000000
    answer_div = max
    answer = [1,1]
    (max/7-1).upto(max/7) do |d_div|
      (d_div*7).upto(d_div*7+6) do |d|
        break if d > max
        (d_div*2+1).upto(d_div*3-1) do |n|
          # p "#{n}/#{d}"
          if 3/7.0-n/d.to_f < answer_div
            answer_div = 3/7.0-n/d.to_f
            answer = [n,d]
            # p "answer_div = #{answer_div}, answer = #{answer}"
          end
          break if compare_with_frac([n,d], [3,7]) < 0
        end
      end
    end
    answer
  end
end
p Problem071.new().compute()
