require "./088"

RSpec.describe Problem088 do
  describe '#divisors' do
    it 'find the array of divisors of n' do
      expect(Problem088.new().divisors(40)).to eq([2, 4, 5, 8, 10, 20, 40])
    end
  end
  describe '#compute' do
    it 'is solve Problem 088' do
      expect(Problem088.new().compute()).to eq(7587457)
    end
  end
end