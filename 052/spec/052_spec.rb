require "./052"

RSpec.describe Problem052 do
  describe '#compute' do
    it 'is solve Problem 052' do
      expect(Problem052.new().compute()).to eq(142857)
    end
  end
end