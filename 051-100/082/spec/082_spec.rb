require "./082"

RSpec.describe Problem082 do
  describe '#compute' do
    it 'is solve Problem 082' do
      expect(Problem082.new().compute()).to eq(260324)
    end
  end
end
