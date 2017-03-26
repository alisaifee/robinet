module Robinet
  class Middleware
    def initialize(app)
      @app = app
      @limiter = Robinet::Limiter.new(@app)
    end

    def call(env)
      request = Rack::Request.new(env)
      begin
        check_limits(request)
        @app.call(env)
      rescue Errors::RateLimitExceeded => e
        e.http_response
      end
    end

    private

    def check_limits(request)
      @limiter.execute(request)
    end
  end
end
