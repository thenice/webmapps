ActionController::Routing::Routes.draw do |map|
  map.resources :layer_settings

  map.resources :layer_filters

  
  map.connect 'layers/new_from_filters/:id/:project_id', :controller => 'layers', :action => 'new_from_filters'
  map.resources :layers, :has_many => :features
  map.connect 'layers/:layer_id/features/:action/:id.:format', :controller => 'features'
  
  map.connect 'user_profiles/edit', :controller => 'user_profiles', :action => 'edit'
  map.resources :user_profiles
  map.resources :projects
  
  map.resources :users
  map.resources :user_sessions
  map.resource :imports
  map.resource :account, :controller => "users"
  
  map.import_layer 'projects/:id/import_layer/:action', :controller => 'imports'
  map.root :controller => "user_sessions", :action => "new"
  map.login "login", :controller => 'user_sessions', :action => 'new'
  map.dashboard "dashboard", :controller => 'dashboard', :action => 'index'
  map.logout "logout", :controller => 'user_sessions', :action => 'destroy'
  map.client "Client", :controller => 'client'
  map.mapper "mapper", :controller => 'client', :action => 'index'
  
  map.import_new_layer 'projects/:id/import_layer/new', :controller => 'imports', :action => 'new'
  map.connect '/user_profile', :controller => 'user_profiles', :action => 'show'
  map.connect '/projects/:id/:action', :controller => 'projects'
  map.connect '/projects/:id/publish', :controller => 'projects', :action => 'publish'
  map.connect '/projects/:id/share', :controller => 'projects', :action => 'share'
  map.connect 'projects/:project_id/:controller/:action/:id'
  map.connect ':controller/:action/'
  map.connect ':controller/:action/:id'
  map.connect ':controller/', :action => 'index'
  map.connect '/server/:controller/:action/:id'
  map.connect '/resources/layer/:action/:id', :controller => 'layersproject'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
  
end
