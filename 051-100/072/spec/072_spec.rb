require "./072"

RSpec.describe Problem072 do
  describe '#compute' do
    it 'is solve Problem 072' do
      expect(Problem072.new().compute()).to eq(303963552391)
    end
  end
end
