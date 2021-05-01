require "./036"

RSpec.describe Problem036 do
    describe '#compute' do
        it 'is solve Problem 036' do
            expect(Problem036.new().compute()).to eq(872187)
        end
    end
end
