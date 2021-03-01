class Problem016
  def compute()
    (2**1000).to_s.chars.map(&:to_i).inject(*:+)
  end
end
p Problem016.new().compute()