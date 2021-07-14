require "./053"

RSpec.describe Problem053 do
  describe '#compute' do
    it 'is solve Problem 053' do
      expect(Problem053.new().compute()).to eq(4075)
    end
  end
end
