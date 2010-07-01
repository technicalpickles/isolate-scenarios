require 'isolate'
require 'isolate/scenarios/sandbox'
require 'isolate/scenarios/cli'

module Isolate
  module Scenarios
    def self.now!
      @@sandbox = Isolate::Scenarios::Sandbox.new
      @@sandbox.activate
    end
  end
end
