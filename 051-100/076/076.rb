class Problem076
  @@patterns = []

  def get_patterns(n, m)
    return @@patterns[n][m] unless @@patterns[n].nil? || @@patterns[n][m].nil?
    return 1 if m == 1
    @@patterns[n] = [] if @@patterns[n].nil?
    @@patterns[n][m] = [*1..n/m].map{ |i| [*1..m-1].map{ |j| get_patterns(n-m*i, m-j) }.sum }.sum
  end

  def compute()
      n = 100
      [*1..n-1].map{ |i| get_patterns(n, n-i)}.sum
  end
end
p Problem076.new().compute()