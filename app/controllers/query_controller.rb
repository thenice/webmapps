class QueryController < ApplicationController

  require 'json'
  
  before_filter :require_user
  
  # { 'sourceLayerID' => id, 'compareMethodName' => 'contains', 'compareLayerID' => id, 'newLayerName' => 'nam }
  def execute
    query = SpatialQuery.from_JSON(params['query'])
    open_project(params['projectID']) do |project|
      if query.execute?
        layer = query.to_layer
        layer.user = current_user
        project.layers << layer
        render :json => {:status => 'success'}.to_json
      else
        render :json => {:status => 'error'}.to_json
      end
    end
  end
  
end
