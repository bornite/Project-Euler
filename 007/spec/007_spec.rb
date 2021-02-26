require "./007"

RSpec.describe Problem007 do
    describe '#compute' do
        it 'is solve Problem 007' do
            expect(Problem007.new().compute()).to eq(104743)
        end
    end
end