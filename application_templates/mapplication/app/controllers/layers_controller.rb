class LayersController < ApplicationController
  
  before_filter :draw_map
  
  def draw_map
    @map = GMap.new("map_div")
  	@map.control_init(:large_map => true,:map_type => true)
  end
  
  def list
      @layer_id = params[:id] || 0
      session[:selected_tab] = @layer_id
      @page = params[:page] || 1
      current_layer = @mapplication.get_layer @layer_id.to_i
      @features = current_layer.paginate(:current_page => @page)[:items]
      draw_colletion_on_map(@features)
      #@zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))
  end

  def show
    session[:selected_tab] = params[:layer_id]
    @feature = @mapplication.get_layer(params[:layer_id].to_i).find(params[:feature_id])
    @attributes = get_attributes(@feature)
    draw_colletion_on_map([@feature])
  end
  
  private
  
  def draw_colletion_on_map(collection = [])
    center = collection[0].the_geom.envelope.center
    @map.center_zoom_init([center.y, center.x], 8)
    collection.each do |feature|
      @map.overlay_init(GMarker.new([feature.the_geom.envelope.center.y, feature.the_geom.envelope.center.x], :title => 'title', :info_window => feature.attributes.first[1].to_s))
      @map.overlay_init(feature.google_shape)
    end
  end
  
  def get_attributes(feature)
    feature.attributes.delete_if { |k,v| k == feature.class.geom_column }
  end

end
