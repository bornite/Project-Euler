require "./019"

RSpec.describe Problem019 do
    describe '#compute' do
        it 'is solve Problem 019' do
            expect(Problem019.new().compute()).to eq(171)
        end
        it 'is another solution for Problem 019' do
            expect(Problem019.new().compute_another_solution()).to eq(171)
        end
    end
end
