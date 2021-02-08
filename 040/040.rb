seq = []
(1..200_000).each {|n|
	numbers = n.to_s.chars
	numbers.each {|x|
		seq.push(x)
	}
}
p seq.length
idx = [1, 10, 100, 1000, 10000, 100000, 1000000]
answer = 1
idx.each {|i|
	answer *= seq[i-1].to_i
}
p answer
