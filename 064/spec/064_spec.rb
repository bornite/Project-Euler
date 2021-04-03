require "./064"

RSpec.describe Problem064 do
  describe '#get_int_part_of_sqrt' do
    it 'calculate the integer part of the square root of 10 and 20' do
      expect(Problem064.new().get_int_part_of_sqrt(10)).to eq(3)
    end
  end

  describe '#square?' do
    it 'returns true if n = 16' do
      expect(Problem064.new().square?(16)).to eq(true)
    end
  end
  describe '#compute' do
    it 'is solve Problem 064' do
      expect(Problem064.new().compute()).to eq(1322)
    end
  end
end
