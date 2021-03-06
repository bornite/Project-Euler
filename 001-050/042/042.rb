class Problem042
	def triangle_word?(word, triangle_numbers)
		word_value = word.each_byte.reduce(0){|s,v| s+(v-64)}
		triangle_numbers.include?(word_value)
	end

	def compute()
		triangle_numbers = (1..1000).map { |n| (n*(n+1))/2 }.to_a
		File.read(File.dirname(__FILE__) + '/words.txt').scan(/\w+/).select { |word|
			triangle_word?(word, triangle_numbers)
		}.count
	end
end
p Problem042.new().compute()