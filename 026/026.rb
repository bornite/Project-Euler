p (2..10).map { |d| 
  (1..d).detect(lambda{0}) { |t| (10**t % d) == 1 } 
}
