require "./001"

RSpec.describe Problem001 do
  describe '#compute' do
    it 'returns the sum of all the multiples of 3 or 5 below 1000' do
      expect(Problem001.new().compute()).to eq(233168)
    end
  end
end