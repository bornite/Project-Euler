require "./063"

RSpec.describe Problem063 do
  describe '#compute' do
    it 'is solve Problem 063' do
      expect(Problem063.new().compute()).to eq(49)
    end
  end
end
