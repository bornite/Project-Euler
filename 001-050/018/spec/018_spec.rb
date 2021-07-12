require "./018"

RSpec.describe Problem018 do
    describe '#compute' do
        it 'is solve Problem 018' do
            expect(Problem018.new().compute()).to eq(1074)
        end
    end
end
