class Problem014
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
    length = [0, 1]
    2.step(1000000, 1) do |n|
       length[n] = get_length_collaz_sequence(n, 0)
    end
    length.index(length.max)
  end
end
p Problem014.new().compute()