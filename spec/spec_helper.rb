$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'spec'
require 'spec/autorun'

require 'isolate-scenarios'
Isolate::Scenarios.now!

Spec::Runner.configure do |config|
  
end
