class Problem058
  def prime?(n)
    return false if n <= 1 || (n != 2 && n % 2 == 0)
    return true if n == 2
   
    limit = Math.sqrt(n).ceil
    3.step(limit, 2) do |i|
      return false if n % i == 0
    end
    return true
  end
  
  def compute()
    n = 3
    arr_len = 1
    prime_len = 0
    arr = []
    loop do
        [*1..4].each do |i|
          j = (n-2)**2+i*(n-1)
          if prime?(j)
              arr.push(j)
              prime_len += 1
          end
        end
        arr_len += 4
        ratio = (prime_len/arr_len.to_f)
        p "n = #{n}, ratio = #{ratio}"
        break if ratio < 0.1
        n += 2
    end
    return n
  end
end
p Problem058.new().compute()