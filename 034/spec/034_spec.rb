require "./034"

RSpec.describe Problem034 do
    describe '#compute' do
        it 'is solve Problem 034' do
            expect(Problem034.new().compute()).to eq(40730)
        end
    end
end
