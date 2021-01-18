require 'prime'

def polynomial(a, b, n) = (n.to_i)**2 + (a.to_i)*(n.to_i) + b.to_i

a = (-999..999)
b = (-999..999)
result = a.to_a.product(b.to_a).map {|a, b|
	[(0..100).take_while { |n| polynomial(a, b, n).prime? }.count, a , b]
}.max
p result
p result[1].to_i * result[2].to_i