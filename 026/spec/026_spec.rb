require "./026"

RSpec.describe Problem026 do
    describe '#compute' do
        it 'is solve Problem 026' do
            expect(Problem026.new().compute()).to eq(983)
        end
    end
end