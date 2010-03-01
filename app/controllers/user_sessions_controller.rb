class UserSessionsController < ApplicationController
  
  def new
    @title = "Login to Webmapps"
    @current_user = UserSession.find
    unless @current_user.blank?
      redirect_to dashboard_url
    else
      # present login form
      @user_session = UserSession.new
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    debugger
    if @user_session.save
      if session[:return_to]
        redirect_to session[:return_to]
      else
        redirect_to dashboard_url
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    unless @user_session.blank?
      session = nil
      @user_session.destroy
      flash[:head] = "You've been logged out. "
      flash[:notice] = "Have a great day!"
      redirect_to login_url
    else
      render :text => "No user logged in."
    end
  end
  
end
