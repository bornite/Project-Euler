require "./014"

RSpec.describe Problem014 do
    describe '#compute' do
        it 'is solve Problem 014' do
            expect(Problem014.new().compute()).to eq(837799)
        end
    end
end