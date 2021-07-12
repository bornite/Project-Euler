require "./013"

RSpec.describe Problem013 do
    describe '#compute' do
        it 'is solve Problem 013' do
            expect(Problem013.new().compute()).to eq("5537376230")
        end
    end
end
