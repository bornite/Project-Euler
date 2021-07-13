require "./045"

RSpec.describe Problem045 do
    describe '#compute' do
        it 'is solve Problem 045' do
            expect(Problem045.new().compute()).to eq(1533776805)
        end
    end
end
