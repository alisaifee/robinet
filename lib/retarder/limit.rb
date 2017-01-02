module Retarder
  class Limit
    attr_reader :amount, :multiples, :granularity
    def initialize(amount, multiples, granularity)
      @amount = amount.to_i
      @multiples = [multiples.to_i, 1].max
      @granularity = granularity.to_sym
    end

    def ==(other)
      [@amount, @multiples, @granularity] == [other.amount, other.multiples, other.granularity]
    end
  end
end