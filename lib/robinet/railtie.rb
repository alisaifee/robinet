module Robinet
  class Railtie < Rails::Railtie
    initializer 'robinet.add_middleware' do |application|
      application.middleware.use Robinet::Middleware
      register_rails_helpers
    end
    def register_rails_helpers
      ActionController::Base.include(Robinet::RailsHelpers::ActionController)
    end
  end if defined?(Rails)
end