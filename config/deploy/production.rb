set :domain, 'portablelight.crushserver.com'
set :rails_env, "production"

role :web, domain
role :app, domain, :primary => true
role :db,  domain, :primary => true
role :scm, domain

