class Problem048
    def self_powers_series(n)
        (1..n).reduce(0) { |s,i| s + i**i }
    end

    def compute()
        self_powers_series(1_000).to_s[-10..-1]
    end
end
p Problem048.new().compute()