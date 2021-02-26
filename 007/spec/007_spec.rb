require "./007"

RSpec.describe Problem007 do
    describe '#compute' do
        it 'is solve Problem 007' do
            expect(Problem007.new().compute()).to eq(104743)
        end
    end

    describe '#get_nth_prime_number' do
        it 'is get the 6th prime number' do
            expect(Problem007.new().get_nth_prime_number(6)).to eq(13)
        end
    end
end