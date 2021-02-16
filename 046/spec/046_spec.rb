require "./046"

RSpec.describe Problem046 do
  describe '#compute' do
    it 'is solve Problem 046' do
      expect(Problem046.new().compute()).to eq(5777)
    end
  end
end
