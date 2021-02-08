seq = []

=begin
Single digit number : 9
Two-digit number    : 99 - 9 = 90
3-digit number      : 999 - 99 = 900 
4-digit number      : 9999 - 999 = 9000
...
All characters in numbers of 5 digits or less -> 9 * 1 + 90 * 2 + 900 * 3 + 9000 * 4 + 90000 * 5 = 488889 characters 
Number of characters in the number between 100,000 and 200,000 -> 100_001 * 6 = 600006 characters
Therefore, Number of characters less than or equal to 200,000 = 1,088,895 characters
=end

(1..200_000).each {|n|
	numbers = n.to_s.chars
	numbers.each {|x|
		seq.push(x)
	}
}

idx = [1, 10, 100, 1000, 10000, 100000, 1000000]
answer = 1
idx.each {|i|
	answer *= seq[i-1].to_i
}
p answer
