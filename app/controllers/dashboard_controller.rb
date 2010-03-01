class DashboardController < ApplicationController
  
  before_filter :require_user
  
  def index
    redirect_to :action => :dashboard
  end
  
  def dashboard
    @title = "Here's your Webmapps dashboard"
    @projects = current_user.projects
  end
  
  def projects
    @title = "These are the projects that belong to you"
    @my_projects = current_user.my_projects.sort
    @shared_projects = current_user.shared_projects.sort
  end
  
  def groups
    @title = "Browse Groups within your organization"
    @groups = Group.all
  end
  
  ## - ajax requests --
  
  def projects_layers_show
    @project = Project.find(params[:project_id])
    @layers = (@project.user_has_access?(current_user)) ? @project.layers : []
    @div = "project-layers-#{@project.id}"
    @show = "project-show-#{@project.id}"
    @hide = "project-hide-#{@project.id}"
  end
  
  def projects_layers_hide
    @project_id = params[:project_id]
    @div = "project-layers-#{@project_id}"
    @show = "project-show-#{@project_id}"
    @hide = "project-hide-#{@project_id}"
  end
  
  
  
  
end
