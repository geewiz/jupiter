# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end

task default: ["bundle:audit", :rubocop, :rbp, :brakeman]

desc "Run Ruby linter"
task :rubocop do
  sh "bundle exec rubocop ."
end

desc "Check for Rails Best Practices"
task :rbp do
  sh "rails_best_practices ."
end

desc "Check for security weaknesses"
task :brakeman do
  sh "brakeman"
end

namespace :db do
  task :nuke do
    sh "bundle exec rails db:migrate:reset db:seed"
    sh "bundle exec rails db:migrate:reset RAILS_ENV=test"
  end
end
