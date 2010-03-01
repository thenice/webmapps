class ClientController < ApplicationController
  
  # Don't include the token yet...
  #protect_from_forgery :only => [:foo]
  
  before_filter :require_user
  
  def webmapps
    open_project(params[:id]) do |project|
      @project = project
    end
  end
  
  def map
    @map = GMap.new("map")
  	@map.control_init(:large_map => true,:map_type => true)
  	@map.center_zoom_init([75.5,-42.56],4)
  	@map.overlay_init(GMarker.new([75.6,-42.467],:title => "Hello", :info_window => "Info! Info!")) 
  end
  
end
