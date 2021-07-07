require "./089"

RSpec.describe Problem089 do
  describe '#compute' do
    it 'is solve Problem 089' do
      expect(Problem089.new().compute()).to eq(743)
    end
  end
end
