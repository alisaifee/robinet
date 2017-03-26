describe Robinet::Parser do
  describe '#test' do
    it 'raises an error for an empty limit' do
      expect{Robinet::Parser.extract('')}.to raise_error Robinet::Parser::InvalidRateLimit
    end
    it 'returns an array of a single limit' do
      expect(Robinet::Parser.extract('5 per minute')).to eq([Robinet::Limit.new(5, 1, :minute)])
    end
    it 'returns an array of a multiple limits' do
      expect(Robinet::Parser.extract('5 per minute; 1 per 2 days')).
          to eq(
                 [
                     Robinet::Limit.new(5, 1, :minute),
                     Robinet::Limit.new(1, 2, :day),
                 ]
             )
    end
  end
end
