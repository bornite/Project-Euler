require "./065"

RSpec.describe Problem065 do
  describe '#compute' do
    it 'is solve Problem 065' do
      expect(Problem065.new().compute()).to eq(272)
    end
  end
end
