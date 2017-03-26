require 'dry/configurable'

module Robinet
  extend Dry::Configurable

  setting :enabled, false
  setting :logger
  setting :log_level, :warn

  def self.logger
    config.logger || default_logger
  end

  def self.default_logger
    Logger.new(STDOUT).tap { |logger| logger.level = config.log_level }
  end

  private_class_method :default_logger
end
