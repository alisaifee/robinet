describe Retarder::Parser do
  describe '#test' do
    it 'raises an error for an empty limit' do
      expect{Retarder::Parser.extract('')}.to raise_error Retarder::Parser::InvalidRateLimit
    end
    it 'returns an array of a single limit' do
      expect(Retarder::Parser.extract('5 per minute')).to eq([Retarder::Limit.new(5, 1, :minute)])
    end
    it 'returns an array of a multiple limits' do
      expect(Retarder::Parser.extract('5 per minute; 1 per 2 days')).
          to eq(
                 [
                     Retarder::Limit.new(5, 1, :minute),
                     Retarder::Limit.new(1, 2, :day),
                 ]
             )
    end
  end
end