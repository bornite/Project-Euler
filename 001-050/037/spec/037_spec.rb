require "./037"

RSpec.describe Problem037 do
    describe '#compute' do
        it 'is solve Problem 037' do
            expect(Problem037.new().compute()).to eq(748317)
        end
    end
    describe '#trancatable_l' do
        it 'check if a number is prime by remove digit from left to right' do
            expect(Problem037.new().trancatable_l("3797")).to eq(true)
        end
    end
    describe '#trancatable_r' do
        it 'check if a number is prime by remove digit from right to left to' do
            expect(Problem037.new().trancatable_l("3797")).to eq(true)
        end
    end
end