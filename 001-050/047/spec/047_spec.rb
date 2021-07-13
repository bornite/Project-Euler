require "./047"

RSpec.describe Problem047 do
  describe '#compute' do
    it 'is solve Problem 047' do
      expect(Problem047.new().compute()).to eq(134043)
    end
  end
end
