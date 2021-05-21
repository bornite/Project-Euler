def hcf(n,m)
  if m < n
    buf = n
    n = m
    m = buf
  end
  return n if m%n == 0
  hcf(m%n, n)
end

l_arr = []

max = 1500000
2.upto(Math.sqrt(max/2).floor) do |m|
  (m%2+1).step(m-1, 2) do |n|
    next if hcf(n, m) != 1
    l = 2*m*(m+n)
    break if l >= max
    if l < 100
      l_arr.push([*1..(max/l).floor].map{ |i| i*l }).flatten!
    else
      [*1..(max/l).floor].map{ |i| i*l }.each { |j| l_arr.push(j) }
    end
  end
end

h = {}
l_arr.each do |i|
  if h.has_key?(i)
    h[i] += 1
  else
    h[i] = 1
  end
end

twice_or_more = h.select{ |k, v| v > 1 }.keys.map{ |k| k.to_i }
once = l_arr - twice_or_more

p once.length
