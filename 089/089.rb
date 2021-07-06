def change_roman_to_val(roman)
  val = 0
  %w[IV IX XL XC CD CM].each_with_index do |str, i|
    unless roman.index(str).nil?
      val += (i%2 == 0 ? 4 : 9) * 10**(i/2)
      roman.gsub!(/#{str}/, '')
    end
  end
  %w[I V X L C D M].each_with_index do |c, i|
    # p "#{c} #{roman.count(c)}*#{(i%2 == 0 ? 10**(i/2) : 5*10**((i-1)/2))}"
    val += roman.count(c) * (i%2 == 0 ? 10**(i/2) : 5*10**((i-1)/2))
  end
  val
end

def change_val_to_roman(val)
  str = ""
  units = %w[1000 500 100 50 10 5 1].map(&:to_i)
  unit_notations = %w[M D C L X V I]  
  del_notations = %w[CM CD XC XL IX IV]
  
  units.each_with_index do |unit, i|
    if i%2 == 1 && val/units[i+1] == 9 
      str += del_notations[i-1]
      val = val%units[i+1]
    elsif i%2 == 0 && i != 0 && val/unit == 4
      str += del_notations[i-1]
      val = val%unit
    else
      str += unit_notations[i]*(val/unit)
      val = val%unit
    end
  end
  str
end

delegation = 0
File.open("p089_roman.txt") do |f|
  f.each_line.with_index do |line, i|
    original = line.gsub(/\n/, '')
    val = change_roman_to_val(original.clone)
    shortest = change_val_to_roman(val)
    # p "#{original} #{val} #{shortest}"
    delegation += original.length - shortest.length
  end
end
p delegation
