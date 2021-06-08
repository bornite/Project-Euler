class Problem082

  def compute()
    matrix = []
    File.open("matrix.txt") do |f|
      f.each_line{ |line| matrix << line.split(',').map(&:to_i) }
    end

    # 処理の高速化のため、転置する
    matrix = matrix.transpose

    answers = []

    matrix.length.times do |start|
      # start = 1

      # pathはstartからの最短距離を表す
      path = Marshal.load(Marshal.dump(matrix))
      # p path
      # p ''

      path.each_with_index do |row, i|
        if i == 0
          # 1行目はstartから上下移動した距離を格納
          path[i] = row.map.with_index do |elm, j|
            elm = (j < start ? row[j..start].sum : row[start..j].sum)
          end
        else
          # 2行目以降
          # まず、左から移動してきた距離を返す
          path[i] = row.map.with_index do |elm, j|
            elm += path[i-1][j]
          end
          
          # 左から移動してきた距離よりも、上や下から来たほうが速い場合は修正する
          # 理論上はすべて調べなくてはならない
          (path[i].length-1-start).times do
            buf = path[i].dup
            path[i].each.with_index do |elm, j|
              if j != 0 && elm > buf[j-1] + row[j]
                path[i][j] = buf[j-1] + row[j]
                # p "#{elm} -> #{path[i][j]}"
              end
            end
            path[i].each.with_index do |elm, j|
              if j != path[i].length-1 && elm > buf[j+1] + row[j]
                path[i][j] = buf[j+1] + row[j]
                # p "#{elm} -> #{path[i][j]}"
              end
            end
          end
          
        end
        # p path
      end
      answers <<  path[path.length-1].min
      # p answers.length
    end
    answers
    answers.min
  end
end
p Problem082.new().compute()