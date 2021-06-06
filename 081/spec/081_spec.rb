require "./081"

RSpec.describe Problem081 do
  describe '#compute' do
    it 'is solve Problem 081' do
      expect(Problem081.new().compute()).to eq(427337)
    end
  end
end
