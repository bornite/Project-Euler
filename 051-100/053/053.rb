class Problem053
  def fact(n)
    return 1 if n == 0
    x = (1..n).inject(&:*)
  end

  def nCr(n, r)
    return 0 if n < r
    x = fact(n) / (fact(r)*fact(n-r))
  end

  def compute()
    answer = 0
    23.upto(100) do |n|
      2.upto(n) do |r|
        num = nCr(n, r)
        next if num <= 1_000_000
        answer += 1
      end
    end
    answer
  end
end
p Problem053.new().compute()
