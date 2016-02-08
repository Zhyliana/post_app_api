# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

PostAppApi::Application.load_tasks

desc 'start app locally'
task :start_app do
  sh 'bundle exec rake db:drop db:create db:migrate db:seed db:test:prepare'
  sh 'rails s'
end

desc 'run tests'
task :specs do
  sh 'bundle exec rspec spec'
end

