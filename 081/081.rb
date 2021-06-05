class Problem081
  def compute()
    matrix = []
    File.open("matrix.txt") do |f|
      f.each_line{ |line| matrix << line.split(',').map(&:to_i) }
    end
    answer = []
    matrix.each_with_index do |row, i|
      answer[i] = []
      if i == 0
        row.each_with_index do |elm, j|
          if j == 0
            answer[i][j] = matrix[i][j]
          else
            answer[i][j] = answer[i][j-1] + matrix[i][j]
          end
        end
      else
        row.each_with_index do |elm, j|
          if j == 0
            answer[i][j] = answer[i-1][j] + matrix[i][j]
          else
            answer[i][j] = [answer[i][j-1], answer[i-1][j]].min + matrix[i][j]
          end
        end
      end
    end
    answer[-1][-1]
  end
end
p Problem081.new().compute()