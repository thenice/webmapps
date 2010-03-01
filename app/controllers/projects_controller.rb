class ProjectsController < ApplicationController
  
  layout :select_layout
  
  def select_layout
    if params[:action] == "sharing"
      return 'popup'
    else
      return 'project' 
    end
  end
  
  def index
    respond_to do |format|
      format.html { redirect_to :action => 'dashboard', :controller => 'dashboard' }
      format.json {
        @projects = current_user.all_projects
        render :json => @projects.to_json
      }
    end
  end

  def overview
    redirect_to :action => 'show'
  end
  
  def show
    open_project(params[:id]) do |project|
      respond_to do |format|
        format.html {
          session[:project_tab] = "overview"
          @project = project
          @title = "Project Overview and Activity across project"
        }
        format.json {
          render :json => project.to_json
        }
      end
    end
  end
  
  def new
    session[:project_tab] = ""
    @project = Project.new
    @title = "Create a new project"
  end
  
  def create
    @project = Project.new(params[:project])
    @project.owner = current_user
    if @project.save
      flash[:head] = "Project created"
      flash[:notice] = "Successfully created a new project called #{@project.title}."
      redirect_to @project
    else
      render :action => 'new'
    end
  end
  
  def edit
    open_project(params[:id]) do |project|
      @project = project
      @title = "Edit details for #{@project.title}"
    end
  end
  
  def update
    open_project(params[:id]) do |project|
      @project = project
      if @project.update_attributes(params[:project])
        flash[:head] = "Project updated"
        flash[:notice] = "The project #{@project.title} has been updated."
        redirect_to @project
      else
        render :action => 'edit'
      end
    end
  end
  
  def destroy
    open_project(params[:id]) do |project|
      @project = project
      @project = Project.find(params[:id])
      @project.destroy
      flash[:head] = "Project destroyed"
      flash[:notice] = "The project #{@project.title} has been deleted."
      redirect_to dashboard_url
    end
  end
  
  def layers
    open_project(params[:id]) do |project|
      respond_to do |format|
        format.html do
          @project = project
          @title = "Layers in #{@project.title}"
          session[:project_tab] = "layers"
        end
        format.xml do
          render :xml => project.layers
        end
        format.json do
          render :json => project.layers
        end
      end
    end
  end
  
  def sharing
    open_project(params[:id]) do |project|
      session[:project_tab] = "sharing"
      @title = "Share your project across Webmapps"
      @users = User.all
      @groups = Group.all
      @project = project
    end
  end
  
  def update_sharing
    open_project(params[:id]) do |project|
      params[:project][:user_ids] ||= []
      params[:project][:group_ids] ||= []
      if project.update_attributes(params[:project])
        flash[:head] = "Sharing preferences updated"
        flash[:notice] = "The project #{project.title} has been updated."
        redirect_to :action => 'sharing'
      else
        redirect_to :action => 'sharing' 
      end
    end
  end
  
  def switch_projects_open
    respond_to do |format|
      format.js do 
        my_projects = current_user.my_projects.sort
        shared_projects = current_user.shared_projects.sort
        render :update do |page|
          page.replace_html :project_switch_pane, :partial => 'dashboard/small_project_list', :object => {:my_projects => my_projects, :shared_projects => shared_projects}
          page.visual_effect  :blind_down, :project_switch_pane
        end
      end
    end
  end
  
  def switch_project_close
  end
  
  def switch_project
  end
  
end
