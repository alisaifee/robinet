module Robinet
  class Railtie < Rails::Railtie
    initializer 'robinet.add_middleware' do |application|
      if Robinet.config.enabled
        Robinet.logger.info('Enabling Robinet Rate Limiter')
        application.middleware.use Robinet::Middleware
      end
    end
  end if defined?(Rails)
end