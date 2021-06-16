require "./084"

RSpec.describe Problem084 do
  describe '#compute' do
    it 'is solve Problem 084' do
      expect(Problem084.new().compute()).to eq("101524")
    end
  end
end
