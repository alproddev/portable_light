Rails::Generator::Commands::Create.class_eval do
  def include_authentication_in_application
    sentinel = 'class ApplicationController < ActionController::Base'
    logger.add_layout "include Authentication to ApplicationController"
    unless options[:pretend]
      gsub_file 'app/controllers/application_controller.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  include Authentication\n"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def include_authentication_in_application
    look_for = "  include Authentication\n"
    logger.remove_layout "include Authentication to ApplicationController"
    unless options[:pretend]
      gsub_file 'app/controllers/application_controller.rb', /(#{Regexp.escape(look_for)})/mi, ""
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def include_authentication_in_application
    logger.add_layout "include Authentication to ApplicationController"
  end
end



