require "rvm/capistrano"
require 'capistrano_colors'
require "bundler/capistrano"
require 'capistrano-file_db'

set :application, "happycompany"
set :repository,  "git@github.com:superbilk/#{application}.git"

set :deploy_to, "/home/christian/apps/#{application}"

set :scm, :git

set :branch, "master"
set :deploy_via, :remote_cache

default_run_options[:pty] = true
set :use_sudo, false

set :rails_env, "production" #added for delayed job

set :rvm_type, :user
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")

role :web, "vs7.superbilk.org"                          # Your HTTP server, Apache/etc
role :app, "vs7.superbilk.org"                          # This may be the same as your `Web` server
role :db,  "vs7.superbilk.org", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# after "deploy:restart", "deploy:assets:precompile"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# namespace :deploy do
#   namespace :assets do
#     task :precompile, :roles => assets_role, :except => { :no_release => true } do
#       run <<-CMD.compact
#         cd -- #{latest_release.shellescape} &&
#         #{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
#       CMD
#     end
#   end
# end

desc "Echo environment vars"
namespace :env do
  task :echo do
    run "echo printing out cap info on remote server"
    run "echo $PATH"
    run "printenv"
  end
end

namespace :config do
  task :copy, :except => { :no_release => true }, :roles => :app do
    run "cp -f ~/happycompany_config.yml #{release_path}/config/config.yml"
  end
end
after "deploy:finalize_update", "config:copy"
