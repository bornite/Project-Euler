require "./066"

RSpec.describe Problem066 do
  describe '#compute' do
    it 'is solve Problem 066' do
      expect(Problem066.new().compute()).to eq(661)
    end
  end
end
