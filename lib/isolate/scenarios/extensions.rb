module Isolate
  module Scenarios
    # Extension to Isolate::Entry to be scenario friendly
    module Entry
      def scenarios
        options[:scenarios]
      end

      def default_scenario
        options[:default_scenario]
      end

      def scenario_env_variable
        "ISOLATE_#{name.upcase.gsub('-', '_')}_SCENARIO"
      end
    end

    # Extension to Isolate::Sandbox to be scenario friendly
    module Sandbox
      def entries_with_scenarios
        entries.select do |entry|
          entry.scenarios
        end
      end
    end
  end
end
