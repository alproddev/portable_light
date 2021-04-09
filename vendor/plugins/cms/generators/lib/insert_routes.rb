Rails::Generator::Commands::Create.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    sentinel = 'ActionController::Routing::Routes.draw do |map|'

    logger.route "map.resource #{resource_list}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.resource #{resource_list}\n"
      end
    end
  end
  
  def route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    sentinel = 'ActionController::Routing::Routes.draw do |map|'

    logger.route "map.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }\n"
      end
    end
  end
  
  def namespaced_route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    sentinel = "map.namespace(:#{options[:namespace]}) do |#{options[:namespace]}|"

    logger.route "#{options[:namespace]}.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n    #{options[:namespace]}.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }\n"
      end
    end
  end
  
  def route_name(name, path, route_options = {})
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    
    logger.route "map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
      end
    end
  end

  def route_namespace
    sentinel = 'ActionController::Routing::Routes.draw do |map|'
    logger.route "map.namespace(:#{options[:namespace]})"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  map.namespace(:#{options[:namespace]}) do |#{options[:namespace]}|\n  end\n"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    look_for = "\n  map.resource #{resource_list}\n"
    logger.route "map.resource #{resource_list}"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{look_for})/mi, ''
    end
  end
  
  def route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    look_for = "\n  map.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }\n"
    logger.route "map.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{look_for})/mi, ''
    end
  end
  
  def namespaced_route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    look_for = "\n    #{options[:namespace]}.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }\n"

    logger.route "#{options[:namespace]}.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(look_for)})/mi, ""
    end
  end
  
  def route_name(name, path, route_options = {})
    look_for =   "\n  map.#{name} '#{path}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
    logger.route "map.#{name} '#{path}',     :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
    unless options[:pretend]
      gsub_file    'config/routes.rb', /(#{look_for})/mi, ''
    end
  end

  def route_namespace
    look_for = "\n  map.namespace(:#{options[:namespace]}) do |#{options[:namespace]}|\n  end\n"
    logger.route "map.namespace(:#{options[:namespace]})"
    unless options[:pretend]
      gsub_file 'config/routes.rb', /(#{Regexp.escape(look_for)})/mi, ""
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def route_resource(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    logger.route "map.resource #{resource_list}"
  end
  
  def route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    logger.route "map.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
  end
  
  def namespaced_route_resources(*resources)
    resource_list = resources.map { |r| r.to_sym.inspect }.join(', ')
    logger.route "#{options[:namespace]}.resources #{resource_list}, :collection => { :sort => :post }, :member => { :toggle_visibility => :put }"
  end
  
  def route_name(name, path, options = {})
    logger.route "map.#{name} '#{path}', :controller => '{options[:controller]}', :action => '#{options[:action]}'"
  end

  def route_namespace
    logger.route "map.namespace(:#{options[:namespace]})"
  end
end
