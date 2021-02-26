require "./006"

RSpec.describe Problem006 do
    describe '#compute' do
        it 'is solve Problem 006' do
            expect(Problem006.new().compute()).to eq(25164150)
        end
    end
end