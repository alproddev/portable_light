require File.expand_path(File.dirname(__FILE__) + "/../lib/insert_routes.rb")
require File.expand_path(File.dirname(__FILE__) + "/../lib/insert_menu_link_to_cmt.rb")
class CmtGenerator < Rails::Generator::NamedBase
  default_options :namespace => 'admin'

  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_singular_name
  alias_method  :controller_table_name, :controller_plural_name

  def initialize(runtime_args, runtime_options = {})
    super

    @controller_name = @name.pluralize

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_singular_name, @controller_plural_name = inflect_names(base_name)

    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions(controller_class_path, "#{controller_class_name}Controller", "#{controller_class_name}Helper")
      m.class_collisions(class_path, "#{class_name}")

      # Controller, helper, views, and test directories.
      m.directory(File.join('app/models', class_path))
      m.directory(File.join('app/controllers', options[:namespace], controller_class_path))
      m.directory(File.join('app/helpers', options[:namespace], controller_class_path))
      m.directory(File.join('app/views', options[:namespace], controller_class_path, controller_file_name))

      for action in scaffold_views
        m.template(
          "view_#{action}.html.erb",
          File.join('app/views', options[:namespace], controller_class_path, controller_file_name, "#{action}.html.erb")
        )
      end

      # form partial to store form in
      m.template('_form.html.erb', File.join('app/views', options[:namespace], controller_class_path, controller_file_name, "_form.html.erb"))

      m.template('model.rb', File.join('app/models', class_path, "#{file_name}.rb"))

      m.template(
        'controller.rb', File.join('app/controllers', options[:namespace], controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template('helper.rb', File.join('app/helpers', options[:namespace], controller_class_path, "#{controller_file_name}_helper.rb"))

      unless options[:skip_migration]
        m.migration_template(
          'migration.rb', 'db/migrate', 
          :assigns => {
            :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}",
            :attributes     => attributes
          }, 
          :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
        )
      end

      if options[:namespace].blank?
        m.route_resources controller_file_name
      else
        m.namespaced_route_resources controller_file_name
      end
      m.insert_menu_link_to_cmt(humanized_plural_name, controller_file_name)
    end
  end

  protected
    # Override with your own usage banner.
    def banner
      "Usage: #{$0} cmt ModelName field:type, field:type"
    end

    def scaffold_views
      %w[ index new edit ]
    end

    def model_name 
      class_name.demodulize
    end

    def humanized_model_name 
      class_name.underscore.humanize.titlecase
    end

    def humanized_plural_name 
      plural_name.underscore.humanize.titlecase
    end

    def controller_namespace
      options[:namespace].blank? ? '' : options[:namespace].classify + '::'
    end

    def namespace_for_url_helper
      options[:namespace].blank? ? '' : options[:namespace] + '_'
    end

    def inherit_from_controller
      options[:namespace].blank? ? 'Application' : controller_namespace.gsub('::', '')
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
