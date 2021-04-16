class Problem068
  def output(inner, outer, sum)
    len = inner.length
    str = ""
    len.times do |i|
      str += " #{outer[i]},#{inner[i]},#{inner[(i+1)%len]};"
    end
    p sum.to_s + str + ' ' + str.gsub(/[,; ]/, '')
  end
  
  def check(inner, outer)
    arr = []
    len = inner.length
    len.times do |i|
      sum = outer[i] + inner[i] + inner[(i+1)%len]
      return if arr.length != 0 && arr.last != sum
      arr.push(sum)
    end
    output(inner, outer, arr.last)
  end
  
  def create_outer(raw)
    outer = []
    raw.sort!
    outer.push(raw.shift)
    outer.push(raw.sort!{ |a, b| b <=> a })
    outer.flatten
  end
  
  def compute()
    max = 10
    nums = [*1..max]
    outers = nums.combination(max/2).to_a
    
    outers.each do |raw_outer|
      outer = create_outer(raw_outer)
      inners = (nums.dup - outer).permutation(max/2)
      inners.each do |inner|
        check(inner, outer)
      end 
    end
  end
end
Problem068.new().compute()
