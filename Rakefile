require File.expand_path('../config/application', __FILE__)

if %w(development test).include?(Rails.env)
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:rspec)

  task({ test: %w(ui:build rspec cucumber) })
end

Rails.application.load_tasks
