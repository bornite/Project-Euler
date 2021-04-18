require 'prime'

def totient(n)
    return n-1 if n.prime?
  
    ret = n
    prime_factors = n.prime_division()
    prime_factors.each do |p|
      ret = ret*(p[0]-1)/p[0]
    end
    ret
end

def n_divided_by_totient(n)
    return n.to_f/totient(n)
end

limit = 1_000_000
answer = 0
max = 0
2.upto(1_000_000) do |n|
    result = n_divided_by_totient(n)
    if result > max
        max = result
        answer = n
        puts "n:#{n} max:#{max}"
    end
end
p answer