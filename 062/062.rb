class Problem062
  def gen_cubes(max_digits)
    cubes = []
    n = 1
    loop do
      cube = n**3
      cube_len = cube.to_s.length
      break if cube_len > max_digits
      cubes[cube_len] ||= []
      cubes[cube_len].push(cube.to_s.split(''))
      n += 1
    end
    return cubes
  end

  def compute()
    cubes = gen_cubes(12)
    result = []
    cubes.each_with_index do |digits, i|
      result[i] ||= {}
      next if cubes[i].nil?
      digits.each do |arr_n|
        n = arr_n.sort.inject(:+)
        if result[i].key?(n)
          result[i][n].push(arr_n.inject(:+))
        else
          result[i][n] = [arr_n.inject(:+)]
        end
      end
    end

    answer_candidate = []
    result.each do |h|
      next if h.nil?
      answer_candidate =  h.select{ |k,v| v.length == 5 }
    #  answer_candidate.push(output) if output.any?
    end
    answer_candidate.map{ |_, v| v.min }.min
  end
end
p Problem062.new().compute()