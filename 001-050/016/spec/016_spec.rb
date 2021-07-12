require "./016"

RSpec.describe Problem016 do
    describe '#compute' do
        it 'is solve Problem 016' do
            expect(Problem016.new().compute()).to eq(1366)
        end
    end
end