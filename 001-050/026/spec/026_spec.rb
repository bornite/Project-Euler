require "./026"

RSpec.describe Problem026 do
    describe '#to_rec_decimal' do
        it 'calculate Recurring-Decimals' do
            expect(Rational(1, 3).to_rec_decimal()).to eq("0.(3)")
            expect(Rational(1, 7).to_rec_decimal()).to eq("0.(142857)")
        end
    end

    describe '#compute' do
        it 'is solve Problem 026' do
            expect(Problem026.new().compute()).to eq(983)
        end
    end
end