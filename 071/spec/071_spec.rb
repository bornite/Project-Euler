require "./071"

RSpec.describe Problem071 do
  describe '#compute' do
    it 'is solve Problem 071' do
      expect(Problem071.new().compute()).to eq([428570, 999999])
    end
  end
end
