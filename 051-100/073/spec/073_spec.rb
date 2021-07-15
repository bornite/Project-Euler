require "./073"

RSpec.describe Problem073 do
  describe '#compute' do
    it 'is solve Problem 073' do
      expect(Problem073.new().compute()).to eq (7295372)
    end
  end
end
