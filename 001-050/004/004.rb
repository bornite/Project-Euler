class Problem004
  def largest_palindrome_from_product_of_two_numbers(s)
    s.map{ |i|
      s.map{ |j| i*j }.map{ |val| val.to_s.reverse == val.to_s ? val : 0 }.max
    }.max
  end

  def compute()
    s = [*100..999]
    largest_palindrome_from_product_of_two_numbers(s)
  end
end
p Problem004.new().compute()