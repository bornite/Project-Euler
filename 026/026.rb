class Rational
  def to_rec_decimal
    f, num = (self < 0) ? ["-", -self] : ["", self]

    i = num.to_i
    result = f + i.to_s
    ra = num - i
    return result if ra.zero?
    result += "."

    remainder = ra.numerator
    deno      = ra.denominator
    place = []
    rems  = []
    begin
      rems  << remainder
      place << remainder * 10 / deno
      remainder = remainder * 10 % deno
      return result + place.join if remainder.zero?
    end while not (idx = rems.find_index(remainder))
    place.insert(idx, "(")
    result + place.join + ")"
  end
end

class Problem026
  def compute()
    max = 0
    array = (1..1000).map { |d|
    r = Rational(1, d).to_rec_decimal()
      i = r.index("(")
      j = r.index(")")
      cycle_length = (i.nil? || j.nil?) ? 0 : (j - i - 1)
    }
    return (array.index(array.max)+1)
  end
end
p Problem026.new().compute()
