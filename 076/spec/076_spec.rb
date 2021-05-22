require "./076"

RSpec.describe Problem076 do
  describe '#compute' do
    it 'is solve Problem 076' do
      expect(Problem076.new().compute()).to eq (190569291)
    end
  end
end
