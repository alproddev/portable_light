class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  layout 'site'

  helper_method :current_user, :signed_in?, :redirect_to_target_or_default
  filter_parameter_logging :password

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def signed_in?
    current_user
  end

  def users_only
    unless signed_in?
      flash[:error] = "You must be signed in to access this page."
      store_target_location
      redirect_to sign_in_url
    end
  end

  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.request_uri
  end
end
