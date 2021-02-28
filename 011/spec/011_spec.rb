require "./011"

RSpec.describe Problem011 do
    describe '#compute' do
        it 'is solve Problem 011' do
            expect(Problem011.new().compute()).to eq(70600674)
        end
    end
end
