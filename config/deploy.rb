require 'bundler/capistrano'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, "sigma"
set :repository,  "git@github.com:sigma-ifsp/Sigma.git"
set :scm, :git
set :user, 'sigma'
set :port, '7000'

set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

set :branch, 'master'

role :web, "sigmafidelidade.com.br" 
role :app, "sigmafidelidade.com.br"
role :db,  "sigmafidelidade.com.br", :primary => true

namespace :deploy do
  task :start, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup bundle exec thin -e production -s2 --socket /tmp/sigma.sock -R config.ru start"
  end

  task :stop, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup bundle exec thin -e production -s2 --socket /tmp/sigma.sock -R config.ru stop"
  end

  task :database_file, :roles => [:web, :app] do
    run "cp #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
 
  after("deploy:finalize_update","deploy:database_file")

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end
