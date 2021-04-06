require "./029"

RSpec.describe Problem029 do
    describe '#compute' do
        it 'is solve Problem 029' do
            expect(Problem029.new().compute()).to eq(9183)
        end
    end
end