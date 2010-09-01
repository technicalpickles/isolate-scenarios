require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "isolate-scenarios"
    gem.version = "0.0.2"
    gem.summary = %Q{Tool for testing libraries using different senarios of gem versions}
    gem.description = %Q{Tool for testing libraries using different senarios of gem versions}
    gem.email = "josh@technicalpickles.com"
    gem.homepage = "http://github.com/technicalpickles/isolate-scenarios"
    gem.authors = ["Joshua Nichols"]
    gem.add_dependency "thor", "~> 0.14.0"
    gem.add_dependency "isolate", "~> 2.1.2"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new do |t|
end
