require "./023"

RSpec.describe Problem023 do
    describe '#compute' do
        it 'is solve Problem 023' do
            expect(Problem023.new().compute()).to eq(4179871)
        end
    end
end
