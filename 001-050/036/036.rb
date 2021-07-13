class Problem036
    def palindromic?(n)
        n.to_s == n.to_s.reverse
    end
    
    def compute()
        (1..1_000_000).to_a.select {|x| palindromic?(x) && palindromic?(x.to_s(2)) }.sum
    end
end
p Problem036.new().compute()
