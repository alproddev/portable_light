set :stages, %w(production staging)
require 'capistrano/ext/multistage'
require 'crushserver/recipes'

# =============================================================================
# GIT OPTIONS
# =============================================================================
set :scm, :git
set :git_shallow_clone, 1
set :git_enable_submodules, false
ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

after 'moonshine:apply', 'asset:packager:build_all'
before 'db:seed', 'backup:create'

on :start do
  `ssh-add`
end

namespace :paperclip do
  task :refresh, :roles => :app, :only => { :primary => true } do
    run "cd #{current_path}; rake RAILS_ENV=#{rails_env} paperclip:refresh CLASS=Post"
  end
end
