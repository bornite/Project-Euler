class Problem091
  def compute()
    poins = [*0..50].repeated_permutation(2).to_a
            .reject{ |p| p == [0, 0]}
            .combination(2).to_a

    count = 0
    poins.each do |set|
      lsq = []
      lsq << set[0][0]**2 + set[0][1]**2
      lsq << set[1][0]**2 + set[1][1]**2
      lsq << (set[0][0]-set[1][0])**2 + (set[0][1]-set[1][1])**2
      lsq.sort!
      count += 1 if lsq[0]+lsq[1] == lsq[2]
    end
    count
  end
end
p Problem091.new().compute()