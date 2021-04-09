# Portable Light

## Rails Setup

This app requires Rails 2.3.5.  You can check to see if you have that by running `gem list | grep "rails"` and seeing if 2.3.5 is included in the list of versions.  If you don't have it, you can install it by running:

    sudo gem install rails --version=2.3.5 --no-ri --no-rdoc

Once you've got Rails installed, run the following commands to get the app setup.

    cp config/database.yml.sample config/database.yml
    sudo rake gems:install
    rake db:create
    rake db:migrate
    rake db:seed_fu

Then just make sure you've added the app via the Passenger Preference Pane so you can access it at a local host address.

## Deploy

All deployment dependencies are managed via bundler.  Once you've "bundle install"-ed, you can deploy to your desired stage like so:

    bundle exec cap production deploy