require "./079"

RSpec.describe Problem079 do
  describe '#compute' do
    it 'is solve Problem 079' do
      expect(Problem079.new().compute()).to eq (["73162890"])
    end
  end
end
