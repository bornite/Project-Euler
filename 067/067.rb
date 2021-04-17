class Problem067
    def find_path(triangle)
        # Search for the path from the bottom and second from the bottom.
        (triangle.length - 2).downto(0) do |y|
           triangle[y].length.times do |x|
              triangle[y][x] += [triangle[y+1][x], triangle[y+1][x+1]].max
           end
        end
        triangle[0][0]
    end
     
    def compute()
        data = Array.new()
        File.open("triangle.txt") do |file|
          file.each_line do |line|
            data.push(line.split(" ").map(&:to_i))
          end
        end
        find_path(data)
    end
end
p Problem067.new().compute()
