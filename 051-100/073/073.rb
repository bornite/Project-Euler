class Problem073
    def hcf(n,m)
        if m < n
            buf = n
            n = m
            m = buf
        end
        return n if m % n == 0
        hcf(m%n, n)
    end

    def compute()
        max = 12_000
        answer = 0
        (4..max).each do |d|
            (d/3.0).ceil.upto((d/2.0).floor) do |n|
                if hcf(n, d) == 1
                    answer += 1
                end
            end
        end
        answer
    end
end
p Problem073.new().compute()