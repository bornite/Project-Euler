require "./003"

RSpec.describe Problem003 do
  describe '#compute' do
    it 'is solve Problem 003' do
      expect(Problem003.new().compute()).to eq(6857)
    end
  end
end