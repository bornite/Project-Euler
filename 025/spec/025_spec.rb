require "./025"

RSpec.describe Problem025 do
    describe '#compute' do
        it 'is solve Problem 025' do
            expect(Problem025.new().compute()).to eq(4782)
        end
    end
end
