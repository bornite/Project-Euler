class Problem024
  def compute()
    (0..9).to_a.permutation(10).to_a[999999].join
  end
end
p Problem024.new().compute()