require "./060"

RSpec.describe Problem060 do
  describe '#compute' do
    it 'is solve Problem 060' do
      expect(Problem060.new().compute()).to eq(26033)
    end
  end
end
