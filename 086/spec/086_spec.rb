require "./086"

RSpec.describe Problem086 do
  describe '#compute' do
    it 'is solve Problem 086' do
      expect(Problem086.new().compute()).to eq(2772)
    end
  end
end
