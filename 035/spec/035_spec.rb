require "./035"

RSpec.describe Problem035 do
    describe '#compute' do
        it 'is solve Problem 035' do
            expect(Problem035.new().compute()).to eq(55)
        end
    end
end
