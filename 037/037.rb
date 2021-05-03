require 'prime'

class Problem037
  def trancatable_l(str)
    (str.length).times do |i|
      return false if !(str.slice(i, str.length-i).to_i.prime?)
    end
    return true
  end

  def trancatable_r(str)
    (str.length).times do |i|
      return false if !(str.slice(0, str.length-i).to_i.prime?)
    end
    return true
  end

  def compute()
    answer = []
    i = 10
    loop do
      i = i + 1

      str = i.to_s
      next if !trancatable_l(str)
      next if !trancatable_r(str)
      
      answer.push(i)
      break if answer.length >= 11
    end

    p answer
    answer.inject(:+)
  end
end
p Problem037.new().compute()