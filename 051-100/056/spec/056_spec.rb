require "./056"

RSpec.describe Problem056 do
  describe '#compute' do
    it 'is solve Problem 056' do
      expect(Problem056.new().compute()).to eq(972)
    end
  end
end
