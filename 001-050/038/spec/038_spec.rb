require "./038"

RSpec.describe Problem038 do
    describe '#compute' do
        it 'is solve Problem 038' do
            expect(Problem038.new().compute()).to eq(932718654)
        end
    end
end