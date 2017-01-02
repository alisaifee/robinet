module Retarder
  class Parser
    SEPARATORS = /[,;|]{1}/
    SINGLE_EXPR = /\s*([0-9]+)\s*(\/|\s*per\s*)\s*([0-9]+)*\s*(hour|minute|second|day|month|year)s?\s*/i
    EXPR = /^#{SINGLE_EXPR}(:?#{SEPARATORS}#{SINGLE_EXPR})*$/i

    class InvalidRateLimit < StandardError

    end

    def self.extract(limit_string)
      raise InvalidRateLimit unless EXPR.match(limit_string)
      limit_string.split(SEPARATORS).map do |limit|
        _, amount, _, multiples, granularity = *SINGLE_EXPR.match(limit)
        Retarder::Limit.new(amount, multiples, granularity)
      end
    end
  end
end