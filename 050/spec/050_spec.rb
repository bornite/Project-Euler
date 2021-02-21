require "./050"

RSpec.describe Problem050 do
  describe '#compute' do
    it 'is solve Problem 050' do
      expect(Problem050.new().compute()).to eq(997651)
    end
  end

  describe '#get_longest_sum_of_consecutive_primes' do
    it 'compute  longest sum of consecutive primes below 1000' do
      expect(Problem050.new().get_longest_sum_of_consecutive_primes(1_000).reduce(:+)).to eq(953)
    end
  end
end
