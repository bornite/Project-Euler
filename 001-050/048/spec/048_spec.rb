require "./048"

RSpec.describe Problem048 do
  describe '#compute' do
    it 'is solve Problem 048' do
      expect(Problem048.new().compute()).to eq("9110846700")
    end
  end

  describe '#self_powers_series' do
    it 'compute power series up to 10' do
      expect(Problem048.new().self_powers_series(10)).to eq(10405071317)
    end
  end
end