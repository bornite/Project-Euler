require "./085"

RSpec.describe Problem085 do
  describe '#compute' do
    it 'is solve Problem 085' do
      expect(Problem085.new().compute()).to eq(2772)
    end
  end
end
