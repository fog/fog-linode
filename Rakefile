require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs.push 'spec'
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

RuboCop::RakeTask.new

task default: %i[rubocop test]
