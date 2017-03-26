module Robinet
  class Parser
    SEPARATORS = /[,;|]{1}/
    SINGLE_EXPR = /\s*([0-9]+)\s*(\/|\s*per\s*)\s*([0-9]+)*\s*(hour|minute|second|day|month|year)s?\s*/i
    EXPR = /^#{SINGLE_EXPR}(:?#{SEPARATORS}#{SINGLE_EXPR})*$/i


    def self.extract(limit_string)
      raise Errors::InvalidRateLimit unless EXPR.match(limit_string)
      limit_string.split(SEPARATORS).map do |limit|
        _, amount, _, multiples, granularity = *SINGLE_EXPR.match(limit)
        Robinet::Limit.new(amount, multiples, granularity)
      end
    end
  end
end
