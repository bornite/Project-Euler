require "./030"

RSpec.describe Problem030 do
    describe '#compute' do
        it 'is solve Problem 030' do
            expect(Problem030.new().compute()).to eq(443839)
        end
    end
end
