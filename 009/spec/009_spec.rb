require "./009"

RSpec.describe Problem009 do
    describe '#compute' do
        it 'is solve Problem 009' do
            expect(Problem009.new().compute()).to eq(31875000)
        end
    end
end
