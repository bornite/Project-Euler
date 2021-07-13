require "./022"

RSpec.describe Problem022 do
    describe '#compute' do
        it 'is solve Problem 022' do
            expect(Problem022.new().compute()).to eq(871198282)
        end
    end
end
