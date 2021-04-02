require "./064"

RSpec.describe Problem064 do
  describe '#compute' do
    it 'is solve Problem 064' do
      expect(Problem064.new().compute()).to eq(1322)
    end
  end
end
