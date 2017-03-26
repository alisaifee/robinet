module Robinet
  class Limiter

    def initialize(app)
      @app = app
    end

    def execute(request)
      raise Errors::RateLimitExceeded
    end
  end
end