def sum_of_factorial_of_digits?(n)
	n.to_s.length > 1 && n == n.to_s.each_char.map { |d| (1..d.to_i).reduce(1, :*) }.reduce(:+)
end

p (0..50000).select { |i|
	sum_of_factorial_of_digits?(i)
}.reduce(:+)
