require 'set'

pentagonals = (1..10000).map { |n| n*(3*n-1)/2 }.to_set
p pentagonals.to_a.combination(2).select { |n,m|
    pentagonals.include?(n+m) && pentagonals.include?((n-m).abs)
}.map { |a,b| (a-b).abs }.min