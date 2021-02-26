require "./051"

RSpec.describe Problem051 do
  describe '#compute' do
    it 'is solve Problem 051' do
      expect(Problem051.new().compute()).to eq(121313)
    end
  end
end