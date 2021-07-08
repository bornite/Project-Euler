require "./089"

RSpec.describe Problem089 do
  describe '#change_roman_to_val' do
    it 'convert Roman numerals to values' do
      expect(Problem089.new().change_roman_to_val("DXVI")).to eq(516)
    end
  end
  describe '#compute' do
    it 'is solve Problem 089' do
      expect(Problem089.new().compute()).to eq(743)
    end
  end
end