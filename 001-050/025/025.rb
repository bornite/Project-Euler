class Problem025
   # Add a term to the Fibonacci sequence each time it is called.
   def gen_fibo(fibo)
      if fibo.size == 0
         fibo[0] = 1
      end
      if fibo.size == 1
         fibo[1] = 1
      end
      i = fibo.size
      fibo[i] = fibo[i-1] + fibo[i-2]
      return fibo
   end

   def compute()
      fibo = Array.new

      # Infinite loop until the number string length reaches 1000.
      loop do
         fibo = gen_fibo(fibo)
         break if fibo[fibo.size-1].to_s.size == 1_000
      end

      fibo.size
   end
end
p Problem025.new().compute()
