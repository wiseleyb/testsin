load 'deploy' if respond_to?(:namespace)
require 'bundler/capistrano'

set :application, "testsin"
set :user, "ubuntu"
set :use_sudo, true

set :scm, :git
set :repository,  "git://github.com/wiseleyb/testsin.git"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/#{application}"

set :runner, "#{user}"
set :admin_runner, "#{user}"

set :key_pair, "uopen" # ec2 key-pair name, store it in ~/.ssh/ec2/

# deploy to ec2
ssh_options[:keys] = "~/.ssh/ec2/#{key_pair}.pem"
server "ubuntu@ec2-50-16-168-235.compute-1.amazonaws.com", :app, :web, :db, :primary => true

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
    run "cat #{deploy_to}/shared/log/thin.log"
  end
end