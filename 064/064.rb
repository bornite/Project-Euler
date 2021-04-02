class Problem064
  def get_int_part_of_sqrt(n)
    Math.sqrt(n).floor.to_i
  end

  def square?(n)
    (Math.sqrt(n).floor.to_i)**2 == n
  end

  def get_into_rational(root, int, elm)
    denomi = (root - int*int) / elm
    left = (get_int_part_of_sqrt(root)+int)/denomi
    new_int = (denomi*left  - int).abs

    return { "left": left, "denomi": denomi, "root": root, "int": new_int } # left, denomi, root, int
  end

  def get_str_hash(h)
    "#{h[:left]} + (sqrt(#{h[:root]})-#{h[:int]}) / #{h[:denomi]}"
  end

  def compute()
    answer = 0
    n = 2
    loop do
        h = {"root": n, "int": get_int_part_of_sqrt(n), "denomi": 1}

        arr = []
        log = []
        loop do
        h = get_into_rational(h[:root], h[:int], h[:denomi])
        break if log.any?{ |log| log == h }
        arr.push(h[:left])
        log.push(h.dup)
        end

        # p "n = #{n}, arr = #{arr}"
        answer += 1 if arr.length % 2 == 1

        n += 1
        n += 1 if square?(n) # If the next number is a square, skip it.
        break if n > 10000
    end
    answer
  end
end
p Problem064.new().compute()