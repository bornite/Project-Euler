require "./043"

RSpec.describe Problem043 do
    describe '#compute' do
        it 'is solve Problem 043' do
            expect(Problem043.new().compute()).to eq(16695334890)
        end
    end
end
