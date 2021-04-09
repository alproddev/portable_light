require File.expand_path(File.dirname(__FILE__) + "/../lib/insert_routes.rb")
require File.expand_path(File.dirname(__FILE__) + "/../lib/include_authentication.rb")
class CmsFrameworkGenerator < Rails::Generator::Base
  default_options :namespace => 'admin'

  def manifest
    recorded_session = record do |m|
      # Create necessary directories
      admin_dirs.each { |path| m.directory path }

      # Generate CSS Files
      admin_css.each do |file_path|
        m.template(
          "stylesheets/#{file_path}.css",
          File.join('public/stylesheets', options[:namespace], "#{file_path}.css")
        )
      end

      # Generate JS Files
      admin_js.each do |file_path|
        m.template(
          "javascripts/#{file_path}.js",
          File.join('public/javascripts', options[:namespace], "#{file_path}.js")
        )
      end

      if using_namespace?
        # Generate Layout Templates
        m.template(
          "layout.html.erb",
          File.join('app/views/layouts', "#{options[:namespace]}.html.erb")
        )

        # add shared partials for Admin
        m.template("partial_toggle_visibility.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_toggle_visibility.html.erb'))
        m.template("partial_make_sortable.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_make_sortable.html.erb'))
        m.template("partial_destroy.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_destroy.html.erb'))
        m.template("partial_index.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_index.html.erb'))
        m.template("partial_new.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_new.html.erb'))
        m.template("partial_edit.html.erb", File.join("app/views/#{options[:namespace]}/shared", '_edit.html.erb'))

        # Create an Admin controller and functional test
        m.template("controller.rb", File.join('app/controllers', 'admin_controller.rb'))
        m.template("helper.rb", File.join('app/helpers', 'admin_helper.rb'))

        # add view files for Admin Controller
        m.template("view_admin.html.erb", File.join("app/views/#{options[:namespace]}", 'home.html.erb'))

        # Authlogic setup
        m.template("authentication.rb", File.join('lib', 'authentication.rb'))
        m.template("sessions_controller.rb", File.join('app/controllers', 'user_sessions_controller.rb'))
        m.template("view_new_session.html.erb", File.join('app/views/user_sessions', 'new.html.erb'))
        m.template("user.rb", File.join('app/models', 'user.rb'))
        m.template("user_session.rb", File.join('app/models', 'user_session.rb'))
        m.migration_template "migrations/create_users.rb", "db/migrate", :migration_file_name => "create_users"
        m.include_authentication_in_application

        # Routes.  Jacked from Restful Authentication Generator.
        m.route_name('admin',   '/admin',   {:controller => 'admin', :action => 'home'})
        m.route_name('markdown_preview', '/admin/markdown_preview', {:controller => 'admin', :action => 'markdown_preview'})

        m.route_namespace
      else
        m.template(
          "layout.html.erb",
          File.join('app/views/layouts', "application.html.erb")
        )
      end

    end


    puts
    puts ("+" * 70)
    puts
    puts "Crush + Lovely Admin Framework Generator!"
    puts
    puts ("+" * 70)
    puts

    recorded_session

  end

protected

  def admin_dirs
    [
      "app/views/layouts",
      "app/views/user_sessions",
      "app/views/#{options[:namespace]}",
      "app/views/#{options[:namespace]}/shared",
      "public/stylesheets/#{options[:namespace]}",
      "public/javascripts/#{options[:namespace]}"
    ]
  end

  def admin_css
    %w(
      master
    )
  end
  
  def admin_js
    %w( 
    jquery
    jquery.ui
    jquery.form
    jquery.validate
    jquery.tablednd
    application
    swfobject
    )
  end

  def admin_images
    %w()
  end

  def controller_namespace
    options[:namespace].blank? ? '' : options[:namespace].classify + '::'
  end

  def route_namespace
    options[:namespace].blank? ? '' : options[:namespace] + '_'
  end

  def using_namespace?
    !options[:namespace].blank?
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--namespace=[namespace]",
      "Specifies the namespace for the CMT.  By default this is set to 'admin'.") { |v| options[:namespace] = v }
    opt.on("--disable-namespacing",
      "Disables namespacing.  By default namespacing is turned on.") { |v| options[:namespace] = '' }
  end
end
