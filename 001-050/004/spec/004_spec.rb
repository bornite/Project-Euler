require "./004"

RSpec.describe Problem004 do
    describe '#largest_palindrome_from_product_of_two_numbers' do
        it 'is largest palindrome made from the product of two 2-digit numbers' do
            s = [*10..99]
            expect(Problem004.new().largest_palindrome_from_product_of_two_numbers(s)).to eq(9009)
        end
    end

    describe '#compute' do
        it 'is solve Problem 004' do
            expect(Problem004.new().compute()).to eq(906609)
        end
    end
end