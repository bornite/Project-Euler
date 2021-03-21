require "./062"

RSpec.describe Problem062 do
  describe '#gen_cubes' do
    it 'is solve Problem 062' do
      expect(Problem062.new().compute()).to eq(127035954683)
    end
  end
  describe '#compute' do
    it 'calculate cubic numbers within two digits' do
      expect(Problem062.new().gen_cubes(2)).to eq([nil, [["1"], ["8"]], [["2", "7"], ["6", "4"]]])
    end
  end
end
