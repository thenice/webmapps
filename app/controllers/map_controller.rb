class MapController < ApplicationController
  
  def layer
    open_layer(params[:id]) do |layer|
    current_layer = Layer.find(layer.id)
    # retreive all records (features) from the selected layer
    features = current_layer.classify.find_by_sql("SELECT DISTINCT \"#{current_layer.geometric_column_name}\" FROM #{current_layer.table_name}")
    # call acts_as_spatial google_shape method to 
    @shapes = features.collect { |f| f.google_shape }
    envelope = features[0].the_geom.envelope
    @map = Variable.new("_mapView._gMap")
    @center = GLatLng.from_georuby(envelope.center)
    @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))       
  end
end
