module Robinet
  class Railtie < Rails::Railtie
    initializer 'robinet.add_middleware' do |application|
      application.middleware.use Robinet::Middleware
    end
  end if defined?(Rails)
end