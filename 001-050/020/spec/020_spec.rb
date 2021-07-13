require "./020"

RSpec.describe Problem020 do
    describe '#compute' do
        it 'is solve Problem 020' do
            expect(Problem020.new().compute()).to eq(648)
        end
    end
end
