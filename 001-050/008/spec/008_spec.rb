require "./008"

RSpec.describe Problem008 do
    describe '#compute' do
        it 'is solve Problem 008' do
            expect(Problem008.new().compute()).to eq(23514624000)
        end
    end
end
