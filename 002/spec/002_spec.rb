require "./002"

RSpec.describe Problem002 do
  describe '#compute' do
    it 'is solve Problem 002' do
      expect(Problem002.new().compute()).to eq(4613732)
    end
  end
end
