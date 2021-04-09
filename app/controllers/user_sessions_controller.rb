class UserSessionsController < ApplicationController
  layout 'admin'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Signed in successfully."
      redirect_to_target_or_default(admin_url)
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "You have been signed out."
    redirect_to sign_in_url
  end
end
