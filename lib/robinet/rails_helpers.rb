module Robinet
  module RailsHelpers
    module ActionController
      extend ActiveSupport::Concern
      class_methods do
        def rate_limit
        end
      end
    end
  end
end