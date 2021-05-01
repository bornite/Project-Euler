class Problem066
  def square?(n)
    (Math.sqrt(n).floor.to_i)**2 == n
  end

  # Get the integer part of the square root.
  def get_int_part_of_sqrt(n)
    Math.sqrt(n).floor.to_i
  end

  # Rationalization of denominators
  def get_into_rational(root, int, elm)
    denomi = (root - int*int) / elm
    left = (get_int_part_of_sqrt(root)+int)/denomi
    new_int = (denomi*left  - int).abs

    return { "left": left, "denomi": denomi, "root": root, "int": new_int }
  end

  # Finding approximate fractions from sequences of continued fraction expansions.
  def get_convergent(arr)
    int = arr.shift

    answer = { "elm": 1, "denomi": 0 }
    rev = arr.reverse
    rev.each do |i|
      answer = { "elm": answer[:denomi]+answer[:elm]*i, "denomi": answer[:elm] }
    end

    answer = { "elm": answer[:denomi]+answer[:elm]*int, "denomi": answer[:elm] }
    answer
  end

  def compute()
    answer = 0
    answer_x = 0
    n = 2
    loop do

      # root: source of the square root, int: integer part of the square root, denomi: denominator
      h = {"root": n, "int": get_int_part_of_sqrt(n), "denomi": 1}

      conv = nil
      square_flg = false
      arr = [h[:int]]
      log = []
      loop do
        h = get_into_rational(h[:root], h[:int], h[:denomi])

        if log.any?{ |log| log == h }

          square_flg = true if arr.length%2 == 0
          arr.delete_at(arr.length-1) if arr.length != 2
          conv = get_convergent(arr)
          break
        end

        arr.push(h[:left])
        log.push(h.dup)
      end

      # Find the denominator and numerator of an approximate fraction.
      x = conv[:elm]
      y = conv[:denomi]

      if square_flg
        x = x*x
        y = y*y
      end

      if answer_x < x
        answer_x = x
        answer = n
      end
      n += 1
      n += 1 if square?(n)
      break if n > 1000
    end
    answer
  end
end
p Problem066.new().compute()