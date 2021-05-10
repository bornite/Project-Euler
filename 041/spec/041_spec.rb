require "./041"

RSpec.describe Problem041 do
    describe '#compute' do
        it 'is solve Problem 041' do
            expect(Problem041.new().compute()).to eq(210)
        end
    end
end
