class GroupsController < ApplicationController
  
  before_filter :require_user
  
  def index
    redirect_to :action => :list
  end
  
  def new
    respond_to do |format|
      format.json do
        group = Group.new(params[:group])
        if group.save
          render :json => { :complete => true }
        else
          render :json => { :complete => false }
        end
      end
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def list
    respond_to do |format|
      format.json do
        groups = current_user.groups.collect { |g| g.attributes }
        render :json => { :count => groups.count, :records => groups }
      end
      
      format.html do
        @title = "These are the groups you currently belong to"
        @groups = current_user.groups
      end
    end
  end
  
  def layers
    respond_to do |format|
      format.json do
        group = Group.find_by_id(params[:id])
        if group.users.include? current_user
          render :json => group.layers.collect { |l| l.attributes }
        else
          render :json => { :error => 'User does not belong to this group.' }
        end
      end
    end
  end
  
  def join
    respond_to do |format|
      format.json do
        group = Group.find_by_id(params[:id])
        unless group.blank?
          current_user.groups << group
          if current_user.save
            render :json => { :complete => true }
          else
            render :json =>{ :complete => false, :error => 'Not added to group.' }
          end
        else
          render :json => { :error => 'Bad group id.' }
        end
      end  
    end
  end
  
  def leave
    membership = GroupMembership.find(:first, :conditions => { :user_id => current_user, :group_id => params[:id] })
    respond_to do |format|
       format.json do
         unless membership.blank?
           membership.destroy
           render :json => { :complete => true }
         else
           render :json => { :complete => false, :error => "User does not belong to that group."}
         end
       end
     end    
  end
  
  
  
  
  
end
