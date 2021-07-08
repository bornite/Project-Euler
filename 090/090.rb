class Problem090
  def compute()
    patterns = [*0..9].combination(6).to_a.map do |a|
      a << 9 if a.include?(6) && !a.include?(9)
      a << 6 if a.include?(9) && !a.include?(6)
      a.uniq
    end.repeated_combination(2).to_a.uniq
    squares = [*1..9].map{ |i| i**2 }
    count = 0
    patterns.each do |combi|
      check = squares.map do |sq|
        if sq < 10
          (combi[0].include?(sq) && combi[1].include?(0)) ||
            (combi[0].include?(0) && combi[1].include?(sq))
        else
          (combi[0].include?(sq/10) && combi[1].include?(sq%10)) ||
            (combi[0].include?(sq%10) && combi[1].include?(sq/10))
        end
      end.inject(:&)
      count += 1 if check
    end
    count
  end
end
p Problem090.new().compute()