require "./035"

RSpec.describe Problem035 do
    describe '#rotate' do
        it 'calculate the 197 circulated numbers' do
            expect(Problem035.new().rotate(197)).to eq("971")
        end
    end
    describe '#compute' do
        it 'is solve Problem 035' do
            expect(Problem035.new().compute()).to eq(55)
        end
    end
end
