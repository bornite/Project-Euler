require "./075"

RSpec.describe Problem075 do
  describe '#compute' do
    it 'is solve Problem 075' do
      expect(Problem075.new().compute()).to eq (161667)
    end
  end
end
