def square?(n)
  (Math.sqrt(n).floor)**2 == n
end

sum = 0
2.upto(99) do |i|
  next if square?(i)
  sum += Math.sqrt(i).to_s[2..-3][0..99].split('').map(&:to_i).inject(:+)
end
p sum
