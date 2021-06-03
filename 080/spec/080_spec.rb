require "./080"

RSpec.describe Problem080 do
  describe '#compute' do
    it 'is solve Problem 080' do
      expect(Problem080.new().compute()).to eq(40886)
    end
  end
end
