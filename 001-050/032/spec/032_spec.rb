require "./032"

RSpec.describe Problem032 do
    describe '#compute' do
        it 'is solve Problem 032' do
            expect(Problem032.new().compute()).to eq(45228)
        end
    end
end
