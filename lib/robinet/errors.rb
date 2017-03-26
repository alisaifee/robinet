module Robinet
  module Errors
    class RateLimitExceeded < StandardError
      def http_response
        [429, {}, ['Rate Limit Exceeded']]
      end
    end

    class InvalidRateLimit < StandardError
    end
  end
end