require 'bundler'
require 'rubocop/rake_task'

task default: %w[rubocop test]

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

task :run do
  ruby 'lib/challenge.rb'
end

task :test do
  ruby 'test/challenge_test.rb'
end
