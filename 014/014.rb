class Problem014
   @@length = {}
  def get_length_collaz_sequence(n, count)
     if n == 1
        return count+1
     elsif n.even?
        return get_length_collaz_sequence(n.to_i/2, count+1)
     else
        return get_length_collaz_sequence(3*n.to_i+1, count+1)
     end
  end

  def compute()
    @@length = {0 => 0, 1 => 1}
    (2..1_000_000).to_a.each do |n|
       @@length[n] = get_length_collaz_sequence(n, 0)
    end
    #length.index(length.max)
    max = @@length.max{ |x, y| x[1] <=> y[1] }
    return max[0]
  end
end
p Problem014.new().compute()