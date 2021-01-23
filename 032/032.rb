def pandigital?(a, b)
    c = a * b
    check = (a.to_s) + (b.to_s) + (c.to_s)
    if check.each_char.sort.join == "123456789"
        return true
    else
        return false
    end
end

result = (1..4999).to_a.product((1..99).to_a).filter do |a, b|
    pandigital?(a, b)
end
p result.map {|a,b| a*b }.uniq.sum