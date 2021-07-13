require "./027"

RSpec.describe Problem027 do
    describe '#polynomial' do
        it 'calculate the value of the quadratic formula' do
            expect(Problem027.new().polynomial(1,41,39)).to eq(1601)
        end
    end

    describe '#compute' do
        it 'is solve Problem 027' do
            expect(Problem027.new().compute()).to eq(-59231)
        end
    end
end