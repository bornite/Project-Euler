require "./055"

RSpec.describe Problem055 do
  describe '#compute' do
    it 'is solve Problem 055' do
      expect(Problem055.new().compute()).to eq(249)
    end
  end
end