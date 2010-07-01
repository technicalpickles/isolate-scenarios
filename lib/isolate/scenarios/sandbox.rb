module Isolate
  module Scenarios
    class Sandbox
      attr_accessor :gem_to_vary, :versions

      def current_scenario
        if ENV['ISOLATE_SCENARIO']
          scenario = versions.detect do |version|
            ENV['ISOLATE_SCENARIO']== "#{gem_to_vary}-#{version}"
          end
          scenario || raise("No scenario defined for #{ENV['ISOLATE_SCENARIO']}")
        else
          versions.last
        end
      end

      def initialize
        file = "IsolateScenarios"
        instance_eval IO.read(file), file, 1
      end

      def baseline(&block)
        @baseline_sandbox = Isolate::Sandbox.new(&block)
      end

      def gem_version_scenario(gem, *versions)
        @gem_to_vary = gem
        @versions = versions.flatten
      end

      def activate
        puts "Activating scenario: #{gem_to_vary}-#{current_scenario}"

        @baseline_sandbox ||= Isolate::Sandbox.new
        @baseline_sandbox.gem gem_to_vary, current_scenario

        @baseline_sandbox.activate(Isolate.env)
      end

    end
  end
end

