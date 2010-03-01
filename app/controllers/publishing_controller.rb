class PublishingController < ApplicationController
  
  layout 'project'
  
  def index
    open_project(params[:project_id]) do |project|
      session[:project_tab] = "publishing"
      @project = project
      @title = "Publish #{@project.title}"
    end
  end
  
  def list
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
end
