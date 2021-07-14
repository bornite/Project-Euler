require "./054"

RSpec.describe Problem054 do
  describe '#compute' do
    it 'is solve Problem 054' do
      expect(Problem054.new().compute()).to eq(376)
    end
  end
end