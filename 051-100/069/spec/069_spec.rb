require "./069"

RSpec.describe Problem069 do
  describe '#compute' do
    it 'is solve Problem 069' do
      expect(Problem069.new().compute()).to eq(510510)
    end
  end
end