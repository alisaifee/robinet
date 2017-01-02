module Retarder
  class << self
    attr_accessor :root_path
    attr_accessor :lib_path
    def require_libs(*libs)
      libs.each do |lib|
        require "#{lib_path}/#{lib}"
      end
    end
  end
  self.root_path = File.expand_path "..", __FILE__
  self.lib_path = File.expand_path "../retarder", __FILE__
  require_libs 'storage', 'strategy', 'parser', 'limit'
end