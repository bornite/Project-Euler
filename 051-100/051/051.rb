require 'prime'
require 'set'

class Problem051
  def mask_adjacent_digits(n)  
    masked_nums = Set.new
    digit_index = Hash.new {|h, k| h[k] = []}
    n_chars = n.to_s.chars
    n_chars.each_index do |i|
      break if i == n_chars.size - 1 # ignore the last digit
      d = n_chars[i]
      digit_index[d] << i
    end
    digit_index.each do |d, a|
      if a.size >= 2
        2.upto(a.size) do |c_num|
          a.combination(c_num) do |indexes|
            masked = Array.new(n_chars)
            0.upto(c_num - 1) do |i|
              masked[indexes[i]] = '*'
            end
            masked_nums << masked.join
          end
        end
      end
    end
    masked_nums
  end

  def compute()
    candidates = Hash.new {|h, k| h[k] = []}

    Prime.each do |p|
      masked = mask_adjacent_digits(p)
      if not masked.empty?
        masked.each do |m|
          candidates[m] << p 
          if candidates[m].size >= 8
            return candidates[m].min
          end
        end
      end
    end
  end
end
p Problem051.new().compute()