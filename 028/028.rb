def nth_spiral(n)
    (1..n).to_a.map { |i|
        k = 2 * i + 1
        4 * (k**2) - 6*k + 6
    }
end
p nth_spiral(500).sum + 1