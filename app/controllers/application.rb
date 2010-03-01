# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
 protect_from_forgery :secret => "shhhhhhhhhhhhh"
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # returns an array of hashes representing with keys as column names
  # and row data as values. In the event of an error, a hash with a key
  # error is returned and the value is the error description. 
  
  private 
  
  def get_all(resource)
    begin
      results = ((eval(resource.capitalize)).find :all).collect { |i| i.attributes }
    rescue
      results = { :error => "Couldn't retrieve the requested items" }
    ensure
      send_as_json(results)
    end     
  end
  
  # resource is the name of a model, and ids is a csv list of ids
  # returns a hash of hashes with the row's id as the key, and the
  # row returned as the inner hash
  def get(resource, ids)
    begin
      results = {}
      ids.each do |id|
        result = (eval(resource.capitalize).find_by_id(id))
        results[id.to_sym] = result.attributes
      end
    rescue
      results[:error] = "Couldn't retrieve the requested items"
    ensure
      return results
    end
  end 
  
  # options to include: model(Constant), items_per_page, current_page, select
  # returns a hash with: total, pages, current_page, results
  def get_paginated(options = {})
    begin
      select = options[:select] || "*"
      items_per_page = options[:items_per_page].to_i || 10
      model = options[:model]
      count = model.count.to_i
      number_of_pages = ((count % items_per_page) > 0) ? (count / items_per_page)+1 : (count / items_per_page)   
      page = options[:current_page].to_i
      offset = (page * items_per_page) - items_per_page
      rows = model.find(:all, :limit => items_per_page, :offset => offset, :select => select).collect do |row|
        row.attributes
      end
      results = {:count => count, :pages => number_of_pages, :current_page => page, :items => rows}
    rescue
      results = {:error => 'Error paginating.'}
    ensure
      return results
    end    
  end
  
  # sends a resource back to the browser as
  # a JSON object
  def send_as_json(results)
    respond_to do |wants|
      wants.json do
        begin
          unless results[:error]
            render :text => {:results => results}.to_json
          else
            render :text => {:error => results[:error]}
          end
        rescue
          render :text => {:error => 'There was an error sending this object in JSON format.'}.to_json
        end
      end
     end
  end
  
  # resource must be a string which there
  # exits a class for. returns the class
  def classify(resource)
    (eval(resource.capitalize))
  end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
    
    def require_user
      unless current_user
        store_location
        flash[:head] = "You must be logged in to see that"
        flash[:error] = "The requested resource is only available for logged in users."
        redirect_to login_url
        return false
      end
    end
 
    def require_no_user
      if current_user
        store_location
        flash[:head] = "You musn't be logged in to see that"
        flash[:error] = "The requested resource is only available for logged OUT users. Weird."
        redirect_to account_url
        return false
      end
    end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
    
    def open_project(id)
      begin
        project = Project.find(id)
        if project.user_has_access?(current_user)
          yield(project)
        else
          raise Exceptions::NoAccess
        end
      rescue ActiveRecord::RecordNotFound
        flash[:head] = "Couldn't display that record"
        flash[:erorr] = "It most likely doesn't exist"
        redirect_to dashboard_url
      rescue Exceptions::NoAccess
        puts "no access error"
        flash[:head] = "You can't see that"
        flash[:erorr] = "You're just not allowed"
        redirect_to dashboard_url
      end
    end
    
    def open_layer(id)
      begin
        layer = Layer.find(id)
        if layer.all_users.include?(current_user)
          yield(layer)
        else
          raise Exceptions::NoAccess
        end
      rescue ActiveRecord::RecordNotFound
        flash[:head] = "Couldn't display that layer"
        flash[:erorr] = "It most likely doesn't exist"
        redirect_to dashboard_url
      rescue Exceptions::NoAccess
        puts "no access error"
        flash[:head] = "You can't see that"
        flash[:erorr] = "You're just not allowed"
        redirect_to dashboard_url
      end
    end

  
  
end
