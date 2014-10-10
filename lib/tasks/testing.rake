# -*- coding: utf-8 -*-
namespace :testing do

  task :clean do
    `bundle exec rake db:migrate:reset RAILS_ENV=test`
  end

  begin
    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new(:unit) do |t|
      t.pattern = 'spec/**/*_spec.rb'
    end

  rescue LoadError
    desc 'rspec rake task not available (rspec not installed)'
    task :unit do
      abort 'rspec rake task is not available. Be sure to install rspec as a gem'
    end
  end

  begin
    require 'cucumber/rake/task'
    Cucumber::Rake::Task.new(:acceptance) do |t|
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'default'
    end

  rescue LoadError
    desc 'cucumber rake task not available (cucumber not installed)'
    task :acceptance do
      abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem'
    end
  end

  desc 'run all tests'
  task :all => ['testing:clean', 'testing:unit', 'testing:acceptance']
end
