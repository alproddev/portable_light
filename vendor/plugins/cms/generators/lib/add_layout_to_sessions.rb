Rails::Generator::Commands::Create.class_eval do
  def add_layout_to_sessions
    sentinel = 'class SessionsController < ApplicationController'
    logger.add_layout "'auth' to SessionsController"
    unless options[:pretend]
      gsub_file 'app/controllers/sessions_controller.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
        "#{match}\n  layout 'auth'\n"
      end
    end
  end
end

Rails::Generator::Commands::Destroy.class_eval do
  def add_layout_to_sessions
    look_for = "  layout 'auth'\n"
    logger.remove_layout "'auth' from SessionsController"
    unless options[:pretend]
      gsub_file 'app/controllers/sessions_controller.rb', /(#{Regexp.escape(look_for)})/mi, ""
    end
  end
end

Rails::Generator::Commands::List.class_eval do
  def add_layout_to_sessions
    logger.add_layout "'auth' to SessionsController"
  end
end
