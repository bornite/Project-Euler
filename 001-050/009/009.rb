class Problem009
  def find_special_pythagorean_triplet(n)
     [*1..(n/3)+1].each do |a|
       [*(a+1)..(n-2)].each do |b|
         next if a*a+b*b > 998*998
         c = 1000-a-b
         if a*a+b*b == c*c
           return [a, b, c]
         end
       end
     end
  end

  def compute()
    n = 1000
    find_special_pythagorean_triplet(n).inject(1) {|result, i| result * i }
  end
end
p Problem009.new().compute()
