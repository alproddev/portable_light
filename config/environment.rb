RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'acts_as_markup', :version => '1.3.3'
  config.gem 'paperclip', :version => '2.3.1.1'
  config.gem 'authlogic', :version => '2.1.3'
  config.gem 'cancan', :version => '1.0.2'
  config.gem 'will_paginate', :version => '2.3.12'
  config.gem 'inherited_resources', :version => '0.9.2'
  config.gem 'formtastic', :version => '0.9.2'
  config.gem 'validation_reflection', :version => '0.3.5'
  config.gem 'configliere', :version => '0.0.5'

  config.time_zone = 'UTC'

  config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )

  config.action_controller.page_cache_directory = File.join(RAILS_ROOT, "public", "cache")
end

MAXMIND = {
  :access_key => 'r2qz8beDhSn2',
  :base_url => 'http://geoip1.maxmind.com/f'
}
