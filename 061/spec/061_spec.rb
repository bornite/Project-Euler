require "./061"

RSpec.describe Problem061 do
  describe '#compute' do
    it 'is solve Problem 061' do
      expect(Problem061.new().compute()).to eq(28684)
    end
  end
end
