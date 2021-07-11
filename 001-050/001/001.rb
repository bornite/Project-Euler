class Problem001
	def sum_of_multiple_of_3_and_5(limit) = (1..(limit-1)).to_a.select{ |n| (n % 3 * n % 5) == 0 }.sum

	def compute()
		sum_of_multiple_of_3_and_5(1000)
	end
end
p Problem001.new().compute()