require "./014"

RSpec.describe Problem014 do
    describe '#compute' do
        it 'calculate the length of a Collatz sequence of the number 13' do
            expect(Problem014.new().get_length_collaz_sequence(13,0)).to eq(10)
        end
    end    
    describe '#compute' do
        it 'is solve Problem 014' do
            expect(Problem014.new().compute()).to eq(837799)
        end
    end
end
