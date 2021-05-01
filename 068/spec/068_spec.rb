require "./068"

RSpec.describe Problem068 do
  describe '#compute' do
    it 'is solve Problem 068' do
      expect(Problem068.new().compute()).to eq(6531031914842725)
    end
  end
end
