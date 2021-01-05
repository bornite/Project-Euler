def factorial(n)
    return 1 if n.zero?
    (1..n).inject(:*)
end
 
def combination(n, r)
   return 1 if r.zero?
   (n - r + 1..n).inject(:*) / factorial(r)
end

def permutation(n, r)
   return 1 if r.zero?
   (n - r + 1..n).inject(:*)
end

p combination(40, 20)