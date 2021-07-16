class Problem083
  @@big_num = 999999

  def search_point_in_q(arr, q)
    for_search = Marshal.load(Marshal.dump(arr)).map{ |row| row.map{ |j| j = @@big_num } }
    q.each do |p|
      for_search[p[0]][p[1]] = arr[p[0]][p[1]]
    end
    u_length = for_search.map(&:min).min
    u_idx_i = for_search.map(&:min).index(u_length)
    u_idx_j = for_search[u_idx_i].index(u_length)
    [u_idx_i, u_idx_j]
  end

  def movable_points(u, d)
    vs = []
    vs << [u[0]-1, u[1]] if u[0] != 0 # 左
    vs << [u[0]+1, u[1]] if u[0] != d[0].length-1 # 右
    vs << [u[0], u[1]-1] if u[1] != 0 # 上
    vs << [u[0], u[1]+1] if u[1] != d.length-1 # 下
    vs
  end

  def compute()
    matrix = []

=begin
  matrix = [
    [131, 673, 234, 103, 18],
    [201, 96, 342, 965, 150],
    [630, 803, 746, 422, 111],
    [537, 699, 497, 121, 956],
    [805, 732, 524, 37, 331]
  ]
=end

    File.open("matrix.txt") do |f|
      f.each_line{ |line| matrix << line.split(',').map(&:to_i) }
    end

    d = Marshal.load(Marshal.dump(matrix)).map{ |row| row.map{ |j| j = @@big_num } }
    d[0][0] = matrix[0][0]

    q = [*0..matrix.length-1].repeated_permutation(2).to_a

    while q.flatten.length > 0 do
      # 最小である頂点uの座標をqから取り出す
      u = search_point_in_q(d, q)
      q.delete(u)

      # uから移動可能な各点vを格納
      vs = movable_points(u, d)
      
      # 各点vについてeach
      vs.each do |v|
        new_distance = d[u[0]][u[1]] + matrix[v[0]][v[1]]
        d[v[0]][v[1]] = (new_distance < d[v[0]][v[1]] ? new_distance : d[v[0]][v[1]])
      end
    end
    d[d.length-1][d[0].length-1]
  end
end
p Problem083.new().compute()
