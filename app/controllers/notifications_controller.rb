class NotificationsController < ApplicationController
  
  def uploads
    current_uploads = session[:uploads] || 0
  end
  
end
