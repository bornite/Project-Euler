require "./058"

RSpec.describe Problem058 do
  describe '#compute' do
    it 'is solve Problem 058' do
      expect(Problem058.new().compute()).to eq(26241)
    end
  end
end