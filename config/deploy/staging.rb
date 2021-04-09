set :domain, 'staging.portablelight.org'
set :rails_env, "staging"

role :web, domain
role :app, domain, :primary => true
role :db,  domain, :primary => true
role :scm, domain

