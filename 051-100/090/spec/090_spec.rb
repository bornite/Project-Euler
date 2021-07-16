require "./090"

RSpec.describe Problem090 do
  describe '#compute' do
    it 'is solve Problem 090' do
      expect(Problem090.new().compute()).to eq(1217)
    end
  end
end