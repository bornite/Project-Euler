require "./044"

RSpec.describe Problem044 do
    describe '#compute' do
        it 'is solve Problem 044' do
            expect(Problem044.new().compute()).to eq(5482660)
        end
    end
end
