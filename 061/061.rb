class Problem061
  @@polygonal = []
  def set_polygonal()
    3.upto(8) do |n|
      @@polygonal[n] = []
      i = 1
      loop do
        case n
        when 3 then
          j = i*(i+1)/2
        when 4 then
          j = i*i
        when 5 then
          j = i*(3*i-1)/2
        when 6 then
          j = i*(2*i-1)
        when 7 then
          j = i*(5*i-3)/2
        when 8 then
          j = i*(3*i-2)
        else
          return
        end
        if j < 1000
          i += 1
          next
        end
        break if j > 9999
        @@polygonal[n].push(j)
        i += 1
      end
    end
  end

  def search_cyclical(edge, chain)
    @@polygonal[edge.shift].each do |n|
      if chain.empty?
        search_cyclical(edge.dup, [n])
      else
        if chain.last.to_s.slice(-2,2) == n.to_s.slice(0,2)
          if edge.empty? && n.to_s.slice(-2,2) == chain.first.to_s.slice(0,2)
            chain.push(n)
            p chain
            p chain.inject(:+)
            exit
          elsif edge.any?
            search_cyclical(edge.dup, chain.dup.push(n))
          end
        end
      end
    end
  end

  def compute()
    set_polygonal()

    edges = []
    [*4..8].permutation(5).each{ |a| edges.push(a.unshift(3)) }
    result = []
    edges.each{ |edge| result = search_cyclical(edge, []) }
  end
end
Problem061.new().compute()