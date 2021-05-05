require "./040"

RSpec.describe Problem040 do
    describe '#compute' do
        it 'is solve Problem 040' do
            expect(Problem040.new().compute()).to eq(210)
        end
    end
end
