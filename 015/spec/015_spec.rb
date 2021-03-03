require "./015"

RSpec.describe Problem015 do
    describe '#compute' do
        it 'is solve Problem 015' do
            expect(Problem015.new().compute()).to eq(137846528820)
        end
    end
end
