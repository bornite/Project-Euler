def sum_of_square(n)
   seq = [*1..n]
   seq.map{ |i| i**2 }.sum
end

def square_of_sum(n)
   seq = [*1..n]
   (seq.sum)**2
end

n = 100
p sum_of_square(n)
p square_of_sum(n)
p square_of_sum(n) - sum_of_square(n)
