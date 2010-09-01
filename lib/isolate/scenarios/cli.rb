require 'thor'
module Isolate
  module Scenarios
    class Cli < Thor
      include Thor::Actions

      desc "list", "list scenarios"
      def list
        sandbox = Isolate::Sandbox.new

        sandbox.entries_with_scenarios.each do |entry|
          puts "#{entry.name}:"

          entry.scenarios.each do |scenario|
            is_default_scenario = scenario == entry.default_scenario
            puts "* #{scenario} #{'(default)' if is_default_scenario}"
          end
        end
      end

      desc "rake", "rake for each scenarios"
      def rake(*)
        ARGV.delete('rake')

        sandbox = Isolate::Sandbox.new

        sandbox.entries_with_scenarios.each do |entry|
          entry.scenarios.each do |scenario|
            system "rake #{entry.scenario_env_variable}=#{entry.name}-#{scenario} #{ARGV.join(' ')}"
          end
        end
      end
    end

  end
end
