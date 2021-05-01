require "./017"

RSpec.describe Problem017 do
    describe '#compute' do
        it 'is solve Problem 017' do
            expect(Problem017.new().compute()).to eq(21124)
        end
    end
end
