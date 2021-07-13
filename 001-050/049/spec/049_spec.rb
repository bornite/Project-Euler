require "./049"

RSpec.describe Problem049 do
    describe '#compute' do
        it 'is solve Problem 049' do
            expect(Problem049.new().compute()).to eq("296962999629")
        end
    end
end
