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

namespace :db do
  task :env do
    require 'sequel'
    DB ||= Sequel.connect(ENV['DATABASE_URL'])
  end

  task :migrate => :env do
    require 'sequel/extensions/migration'
    Sequel::Migrator.apply(DB, "db/migrations")
  end

  task :rollback => :env do
    require 'sequel/extensions/migration'
    versions = DB[:schema_migrations].all.map { |m| m[:filename] }
    puts versions
    Sequel::Migrator.apply(DB, "db/migrations", versions[-1])
  end
end
