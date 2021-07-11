require "./005"

RSpec.describe Problem005 do
    describe '#compute' do
        it 'is solve Problem 005' do
            expect(Problem005.new().compute()).to eq(232792560)
        end
    end
end