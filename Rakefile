require "rake/testtask"
require 'vcr'

Rake::TestTask.new do |t|
	t.pattern = 'test/test_*.rb'
end

desc "Run tests"
task :default => :test