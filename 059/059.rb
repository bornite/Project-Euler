class Problem059
    def compute()
        answer = 0
        File.open("p059_cipher.txt") do |f|
            code = f.read.gsub(/\n/, "").split(',').map(&:to_i)

            # 'a'.ord => 97
            # 'z'.ord => 122
            97.upto(122) do |i|
                97.upto(122) do |j|
                    97.upto(122) do |k|
                        pass = [i, j, k]
                        answer_arr = code.map.with_index{ |a, n| (a^pass[n%3]) }
                        next if answer_arr.select{ |c| c < 32 || 122 < c }.any?
                        text = answer_arr.map(&:chr).inject(&:+)
                        if text.include?(" the ")
                            answer = answer_arr.inject(&:+)
                            return answer
                        end
                    end
                end
            end
        end
    end
end
p Problem059.new().compute()
