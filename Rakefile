require "bundler/gem_tasks"

begin
  require 'rspec'
  require 'rspec/core/rake_task'

  desc "Run specs"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/**/*_spec.rb'
  end

  require 'cucumber/rake/task'

  desc "Run features"
  Cucumber::Rake::Task.new :features  do |t|
    t.cucumber_opts = "features --format progress"
  end

  task default: %w[spec features]
rescue LoadError
  # no rspec
end
