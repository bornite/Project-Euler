require "./078"

RSpec.describe Problem078 do
  describe '#compute' do
    it 'is solve Problem 078' do
      expect(Problem078.new().compute()).to eq (55374)
    end
  end
end
