class Problem065
    def compute()
        arr = [2]
        answer_arr = []
        99.times do |i|
        if i % 3 == 1
            arr.push(2*(i/3)+2)
        else
            arr.push(1)
        end

        answer = { "elm": 1, "denomi": 0 }
        rev = arr.reverse
        rev.each do |j|
            answer = { "elm": answer[:denomi]+answer[:elm]*j, "denomi": answer[:elm] }
        end
        answer_arr.push(answer)
        end

        answer_arr.last[:elm].to_s.split('').map(&:to_i).sum
    end
end
p Problem065.new().compute()