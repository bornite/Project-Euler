require "./024"

RSpec.describe Problem024 do
    describe '#compute' do
        it 'is solve Problem 024' do
            expect(Problem024.new().compute()).to eq("2783915460")
        end
    end
end