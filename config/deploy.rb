

set :application, "Webmapps"

# Source code
set :scm, :git
set :repository, "git://github.com/thenice/webmapps.git"
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :checkout
set :ssh_options, { :user => 'dcohen', :password=>"Gibson", :forward_agent => true }

# Deployment servers
set :user, "dcohen"
role :app, "webmapps.com"
role :web, "webmapps.com"
role :db,  "webmapps.com", :primary => true
set :deploy_to, "/home/dcohen/webmapps"
set :notify_email, "daniel.michael.cohen@gmail.com"

namespace :deploy do
	
  task :start, :roles => :app do
    run "cd #{deploy_to}/current; script/plugin install git://github.com/thenice/acts_as_spatial.git --force"
    run "cd #{deploy_to}/current; mongrel_rails start -e development -p #{3000} -d"
  end
  
  task :stop, :roles => :app do
    run "cd #{deploy_to}/current; mongrel_rails stop"
  end
  
  task :restart, :roles => :app do
    run "cd #{deploy_to}/current; mongrel_rails stop; mongrel_rails start -e development -p #{3000} -d"
    run "echo \"WEBSITE HAS BEEN DEPLOYED\""
  end
end

