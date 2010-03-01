class UserProfilesController < ApplicationController
  
  def index
    redirect_to :action => 'show'
  end
  
  def show
    @title = "Here is your public user profile"
    @user_profile = current_user.user_profile
  end
  
  def edit
    @title = "Editing your public profile"
    @user_profile = current_user.user_profile
  end
  
  def update
    @user_profile = UserProfile.find(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      flash[:head] = "Your profile has been successfully updated."
      flash[:notice] = "Good work."
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end
  
end
