require "./059"

RSpec.describe Problem059 do
  describe '#compute' do
    it 'is solve Problem 059' do
      expect(Problem059.new().compute()).to eq(26241)
    end
  end
end
