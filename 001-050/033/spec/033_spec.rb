require "./033"

RSpec.describe Problem033 do
    describe '#compute' do
        it 'is solve Problem 033' do
            expect(Problem033.new().compute()).to eq("100")
        end
    end
end