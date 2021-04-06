class Problem029
	def get_seq_of_distinct_terms(a, b)
		a.to_a.product(b.to_a).map { |i,j| i**j }
	end

	def compute()
#		p get_seq_of_distinct_terms((2..5),(2..5)).uniq.count
		get_seq_of_distinct_terms((2..100),(2..100)).uniq.count
	end
end
p Problem029.new().compute()