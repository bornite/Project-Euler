require "./031"

RSpec.describe Problem031 do
    describe '#compute' do
        it 'is solve Problem 031' do
            expect(Problem031.new().compute()).to eq(73682)
        end
    end
end
