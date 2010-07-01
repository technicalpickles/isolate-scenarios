require 'thor'
module Isolate
  module Scenarios
    class Cli < Thor
      include Thor::Actions

      desc "list", "list scenarios"
      def list
        sandbox = Isolate::Scenarios::Sandbox.new

        puts "#{sandbox.gem_to_vary}:"
        sandbox.versions.each do |version|
          puts "* #{sandbox.gem_to_vary}-#{version}"
        end
      end

      desc "rake", "rake for each scenarios"
      def rake(*)
        ARGV.delete('rake')

        sandbox = Isolate::Scenarios::Sandbox.new

        sandbox.versions.each do |version|
          system "rake ISOLATE_SCENARIO=#{sandbox.gem_to_vary}-#{version} #{ARGV.join(' ')}"
        end
      end
    end

  end
end
