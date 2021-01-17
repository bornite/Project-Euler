require 'prime'

def polynomial(a, b, n)
	return (n.to_i)**2 + (a.to_i)*(n.to_i) + b.to_i
end

a = (-999..999)
b = (-999..999)
p a.to_a.product(b.to_a).map {|a, b|
	[(0..100).take_while { |n| (n**2 + a*n + b).prime? }.count, a , b]
}.max