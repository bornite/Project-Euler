require "./021"

RSpec.describe Problem021 do
    describe '#compute' do
        it 'is solve Problem 021' do
            expect(Problem021.new().compute()).to eq(31626)
        end
    end
end
