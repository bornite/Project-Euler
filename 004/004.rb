def largest_palindrome_from_product_of_two_numbers(s)
  s.map{ |i|
    s.map{ |j| i*j }.map{ |val| val.to_s.reverse == val.to_s ? val : 0 }.max
  }.max
end

s = [*10..99]
p largest_palindrome_from_product_of_two_numbers(s)
s = [*100..999]
p largest_palindrome_from_product_of_two_numbers(s)
