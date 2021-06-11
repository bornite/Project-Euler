require "./083"

RSpec.describe Problem083 do
  describe '#compute' do
    it 'is solve Problem 083' do
      expect(Problem083.new().compute()).to eq(425185)
    end
  end
end
