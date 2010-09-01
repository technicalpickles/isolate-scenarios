require 'isolate'
require 'isolate/scenarios/cli'

Isolate::Entry.class_eval do
  def scenarios
    @options[:scenarios]
  end

  def default_scenario
    @options[:default_scenario]
  end

  def scenario_env_variable
    "ISOLATE_#{name.upcase.gsub('-', '_')}_SCENARIO"
  end
end

Isolate::Sandbox.class_eval do
  def entries_with_scenarios
    entries.select do |entry|
      entry.scenarios
    end
  end
end

Isolate::Events.watch(Isolate::Sandbox, :activating) do |sandbox|
  sandbox.entries.each do |entry|
    if entry.scenarios
      selected_scenario_version = if ENV[entry.scenario_env_variable]
                                    entry.scenarios.detect do |scenario|
                                      ENV[entry.scenario_env_variable] == "#{entry.name}-#{scenario}"
                                    end
                                  elsif entry.default_scenario
                                    entry.default_scenario
                                  else
                                    entry.scenarios.last
                                  end

      if selected_scenario_version
        puts "Activating#{' default' if entry.default_scenario == selected_scenario_version} scenario: #{entry.name}-#{selected_scenario_version}"
        entry.update(selected_scenario_version)
      end
    end
  end
end
