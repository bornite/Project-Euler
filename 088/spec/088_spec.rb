require "./088"

RSpec.describe Problem088 do
  describe '#compute' do
    it 'is solve Problem 088' do
      expect(Problem088.new().compute()).to eq(7587457)
    end
  end
end