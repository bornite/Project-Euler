require "./021"

RSpec.describe Problem021 do
    describe '#is_amicable' do
        it 'determine if the sum of a divisor is a amicable number' do
            expect(Problem021.new().is_amicable(220)).to eq(true)
        end
    end
    describe '#compute' do
        it 'is solve Problem 021' do
            expect(Problem021.new().compute()).to eq(31626)
        end
    end
end
