def pentagonal_under(n)
  ret = []
  i = 1
  loop do
    break if (negative = i*(3*i-1)/2) >= n
    ret << negative
    break if (positive = i*(3*i+1)/2) >= n
    ret << positive    
    i += 1
  end
  ret
end

n = 2
answer = 0
p = [1, 1]
pentagonal = pentagonal_under(100000)
loop do
  p[n] = 0
  pentagonal.each_with_index do |penta, i|
    break if n-penta < 0
    sign = (i%4 <= 1 ? 1 : -1)
    p[n] += sign*p[n-penta]
  end
  p[n] = p[n] % 1000000
  break if p[n] == 0
  n += 1
  break if n > pentagonal.max
end
p n