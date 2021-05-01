require "./070"

RSpec.describe Problem070 do
  describe '#compute' do
    it 'is solve Problem 070' do
      expect(Problem070.new().compute()).to eq(8319823)
    end
  end
end
