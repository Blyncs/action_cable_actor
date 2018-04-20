require 'version'
require 'concurrent-edge'

module ActionCableActor
  class Configuration
    attr_accessor :future_pool

    def initialize
      @future_pool = Concurrent::Future
    end
  end

  def self.configure
    yield(configuration)
  end
end
