# -*- encoding : utf-8 -*-
set :rails_env, "production"

# update crontab
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

namespace :bluepill do
  desc "Stop processes that bluepill is monitoring and quit bluepill"
  task :quit, :roles => [:app] do
    sudo "bluepill stop"
    sudo "bluepill quit"
  end
 
  desc "Load bluepill configuration and start it"
  task :start, :roles => [:app] do
    sudo "bluepill load /var/www/projects/datanest_capistrano/production/current/config/delayed_job.pill"
  end
 
  desc "Prints bluepills monitored processes statuses"
  task :status, :roles => [:app] do
    sudo "bluepill status"
  end
end