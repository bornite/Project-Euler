require "./077"

RSpec.describe Problem077 do
  describe '#compute' do
    it 'is solve Problem 077' do
      expect(Problem077.new().compute()).to eq (190569291)
    end
  end
end
