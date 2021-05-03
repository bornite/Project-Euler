require "./037"

RSpec.describe Problem037 do
    describe '#compute' do
        it 'is solve Problem 037' do
            expect(Problem037.new().compute()).to eq(748317)
        end
    end
end