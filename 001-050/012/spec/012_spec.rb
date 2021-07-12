require "./012"

RSpec.describe Problem012 do
    describe '#compute' do
        it 'is solve Problem 012' do
            expect(Problem012.new().compute()).to eq(76576500)
        end
    end
end
