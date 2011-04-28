load 'deploy' if respond_to?(:namespace)

set :application, "testsin"
set :user, "ubuntu"
set :use_sudo, false

set :scm, :git
set :repository,  "git@github.com:wiseleyb/testsin.git"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/#{application}"

role :app, "ec2-50-16-168-235.compute-1.amazonaws.com"
role :web, "ec2-50-16-168-235.compute-1.amazonaws.com"
role :db,  "ec2-50-16-168-235.compute-1.amazonaws.com", :primary => true

set :runner, user
set :admin_runner, user

namespace :deploy do
  task :start, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup thin -C thin/production_config.yml -R config.ru start"
  end
 
  task :stop, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup thin -C thin/production_config.yml -R config.ru stop"
  end
 
  task :restart, :roles => [:web, :app] do
    deploy.stop
    deploy.start
  end
 
  # This will make sure that Capistrano doesn't try to run rake:migrate (this is not a Rails project!)
  task :cold do
    deploy.update
    deploy.start
  end
end

namespace :acoplet do
  task :log do
    run "cat #{deploy_to}/current/log/thin.log"
  end
end