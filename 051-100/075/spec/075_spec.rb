require "./075"

RSpec.describe Problem075 do
  describe '#compute' do
    it 'is solve Problem 075' do
      expect(Problem075.new().compute()).to eq (161667)
    end
  end

  describe '#hcf' do
    it 'calculate the highest common factor of 6 and 15' do
      expect(Problem075.new().hcf(6,15)).to eq (3)
    end
  end
end
