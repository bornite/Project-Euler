require "./039"

RSpec.describe Problem039 do
    describe '#compute' do
        it 'is solve Problem 039' do
            expect(Problem039.new().compute()).to eq("840")
        end
    end
end
