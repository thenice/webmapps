class FeaturesController < ApplicationController
  # GET /features
  # GET /features.xml
  
  before_filter :require_user
    
  def index
    open_layer(params[:layer_id]) do |layer|
      respond_to do |format|
        format.html { @features = layer.features_without_geom } # returns hash of attributes without geom column
        format.json {
          @features = layer.classify.all
          json = {}
          @features.each do |feature|
            json << feature.send(layer.geometric_column_name)
          end
          render :json => @features } # returns all data in json
        format.xml {
          @features = layer.classify.all
          @layer = layer } #xml rendered in rss.erb file
      end
    end  
  end

  # GET /features/1
  # GET /features/1.xml
  def show
    open_layer(params[:layer_id]) do |layer|
      @feature = layer.classify.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @feature }
        format.json  { render :json => @feature }
      end
    end
  end
  
  def select
    open_layer(params[:layer_id]) do |layer|
      @map = Variable.new("_mapView._gMap")
      @feature = layer.classify.find(params[:id])
      @shape = GPolygon.from_georuby(@feature.the_geom[0], "#990000",5,50.0,"#ff3333",1.0)
      @center = GLatLng.from_georuby(@feature.the_geom.envelope.center)
     end
  end
  
  def map
    open_layer(params[:layer_id]) do |layer|
      @feature = layer.classify.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @feature }
        format.js  { render :json => @feature }
      end
    end
  end
  

  # GET /features/new
  # GET /features/new.xml
  def new
    open_layer(params[:layer_id]) do |layer|
      @feature = layer.classify.new
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @feature }
        format.json  { render :json => @feature }
      end
    end
    
  end

  # GET /features/1/edit
  def edit
    open_layer(params[:layer_id]) { |layer| @feature = layer.classify.find(params[:id]) }
  end

  # POST /features
  # POST /features.xml
  def create
    open_layer(params[:layer_id]) do |layer|
      @feature = layer.classify.new(params[:feature])
      respond_to do |format|
        if @feature.save
          flash[:notice] = 'Feature was successfully created.'
          format.html { redirect_to(@feature) }
          format.xml  { render :xml => @feature, :status => :created, :location => @feature }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /features/1
  # PUT /features/1.xml
  def update
    open_layer(params[:id]) do |layer|
      @feature = layer.classify.find(params[:id])
      respond_to do |format|
        if @feature.update_attributes(params[:feature])
          flash[:notice] = 'Feature was successfully updated.'
          format.html { redirect_to(@feature) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.xml
  def destroy
    open_layer(params[:layer_id]) do |layer|
      @feature = layer.classify.find(params[:id])
      @feature.destroy
      respond_to do |format|
        format.html { redirect_to(features_url) }
        format.xml  { head :ok }
      end
    end
  end
  
end
