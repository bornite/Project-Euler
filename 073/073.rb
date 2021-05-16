class Problem073
  def hcf(n,m)
    # n < mを保障
    if m < n
      buf = n
      n = m
      m = buf
    end
    return n if m%n == 0
    hcf(m%n, n)
  end

  def compute()
    max = 12000
    answer = 0
    (4..max).each { |d|
        (d/3.0).ceil.upto((d/2.0).floor) do |n|
        if hcf(n, d) == 1
            answer += 1
        end
        end
    }
    answer
  end
end
p Problem073.new().compute()