def sum_of_multiple_of_3_and_5(limit)
  return [*1..(limit-1)].select{ |n| n%3 * n%5 == 0 }.sum
end

limit = 1000
p sum_of_multiple_of_3_and_5(limit)
