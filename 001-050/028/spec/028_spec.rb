require "./028"

RSpec.describe Problem028 do
    describe '#sum_of_nth_spiral' do
        it 'calculate the sum of the four corners of the 5-th spiral.' do
            expect(Problem028.new().sum_of_nth_spiral(5)).to eq(101)
        end
    end

    describe '#compute' do
        it 'is solve Problem 028' do
            expect(Problem028.new().compute()).to eq(669171001)
        end
    end
end