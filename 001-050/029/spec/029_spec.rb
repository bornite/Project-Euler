require "./029"

RSpec.describe Problem029 do
    describe '#get_seq_of_distinct_terms' do
        it 'calculate the number of distinct terms of a^b' do
            expect(Problem029.new().get_seq_of_distinct_terms((2..5),(2..5)).uniq.count).to eq(15)
        end
    end

    describe '#compute' do
        it 'is solve Problem 029' do
            expect(Problem029.new().compute()).to eq(9183)
        end
    end
end