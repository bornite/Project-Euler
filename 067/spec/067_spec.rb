require "./067"

RSpec.describe Problem067 do
  describe '#compute' do
    it 'is solve Problem 067' do
      expect(Problem067.new().compute()).to eq(7273)
    end
  end
end
