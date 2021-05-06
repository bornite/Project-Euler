require 'set'

class Problem071
    def compute()
        s = Set.new()
        n = (1..999_999).to_a
        d = (1..1_000_000).to_a
        n.product(d) {|x, y|
            if x < y
                r = Rational(x, y)
                s.add(r)
            end
        }
        array_of_fracs = s.sort.to_a
        i = array_of_fracs.find_index(Rational(3, 7))
        array_of_fracs[i - 1].numerator
    end
end
p Problem071.new().compute()