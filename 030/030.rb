def sum_of_digit_fifth_powers(n)
	n.to_s.chars.map {|s| (s.to_i)**5 }.sum
end

nums = (2..999999).select {|n| n == sum_of_digit_fifth_powers(n) }
p nums.sum