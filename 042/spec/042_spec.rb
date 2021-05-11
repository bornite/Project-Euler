require "./042"

RSpec.describe Problem042 do
    describe '#compute' do
        it 'is solve Problem 042' do
            expect(Problem042.new().compute()).to eq(162)
        end
    end
end
