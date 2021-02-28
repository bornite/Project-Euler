require "./010"

RSpec.describe Problem010 do
    describe '#compute' do
        it 'is solve Problem 010' do
            expect(Problem010.new().compute()).to eq(142913828922)
        end
    end
end
