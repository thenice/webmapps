class LayersController < ApplicationController
  
  before_filter :require_user
  
  
  # GET /layers
  # GET /layers.xml
  def index
    @layers = all_layers
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @layers }
    end
  end

  def map
    respond_to do |format|
      open_layer(params[:id]) do |layer|
        format.js {
          
          @layer = layer
          # retreive all features from the selected layer
          @features = @layer.classify.find_by_sql("SELECT DISTINCT \"#{@layer.geometric_column_name}\" FROM #{@layer.table_name}")
          unless @features.empty?
            envelope = @features.first.the_geom.envelope 
            @map = Variable.new("_mapView._gMap")
            @center = GLatLng.from_georuby(envelope.center)
            @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))
          end
        }
        format.html { redirect_to dashboard_url }
      end
    end
  end
  
  def buffer
    respond_to do |format|
      open_layer(params[:id]) do |layer|
        @layer = layer
        format.js {
          debugger
          # retreive all records (features) from the selected layer
          buffers = @layer.classify.buffer(params[:meters])
          @layer.layer_setting.buffer_size = params[:meters]
          @layer.layer_setting.save!
          @shapes = buffers.collect do |buffer| 
            GPolygon.from_georuby(buffer, get_random_color,2.5,10.0,get_random_color,0.3)
          end
        }
        format.html { redirect_to dashboard_url }
      end
    end
  end    
  
  # GET /layers/1
  # GET /layers/1.xml
  def show
    open_layer(params[:id]) do |layer|
      @layer = layer
      # remove the geom column
      columns = @layer.column_names(:omit_geom => true);
      rows = @layer.features(:filtered => ((params[:filtered]) ? true : false), :omit_geom => true)
      filters = @layer.layer_filters.collect {|filter| filter.attributes } if params[:filtered]
        respond_to do |format|
        if current_user.all_layers.include? @layer
          format.html # show.html.erb
          # json request returns geo features of that layer
          format.json {
            json = { }
            json['column_names'] = columns
            json['features'] = rows
            json['name'] = @layer.name
            json['filters'] = filters if params[:filtered]
            json['count'] = rows.size
            render :json => json.to_json
          }
        else
          format.html { redirect_to layer_list_url } #Don't show the layer
          format.xml  { render :xml => { :error => "No Access"} }
          format.json { render :json => { :error => "No Access"} }
        end
      end
    end
  end

  # GET /layers/new
  # GET /layers/new.xml
  def new
    @layer = Layer.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @layer }
    end
  end

  # GET /layers/1/edit
  def edit
    @layer = Layer.find(params[:id])
  end

  # POST /layers
  # POST /layers.xml
  def create
    @layer = Layer.new(params[:layer])

    respond_to do |format|
      if @layer.save
        flash[:notice] = 'Layer was successfully created.'
        format.html { redirect_to(@layer) }
        format.xml  { render :xml => @layer, :status => :created, :location => @layer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @layer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /layers/1
  # PUT /layers/1.xml
  def update
    @layer = Layer.find(params[:id])

    respond_to do |format|
      if @layer.update_attributes(params[:layer])
        flash[:notice] = 'Layer was successfully updated.'
        format.html { redirect_to(@layer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @layer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /layers/1
  # DELETE /layers/1.xml
  def destroy
    @layer = Layer.find(params[:id])
    @layer.destroy

    respond_to do |format|
      format.html { redirect_to(layers_url) }
      format.xml  { head :ok }
    end
  end

  # POST /layers/new_from_filters/1/4
  def new_from_filters
    debugger
    open_layer(params[:id]) do |layer|
      new_layer = layer.layer_from_filters
      respond_to do |format|
        format.json do
          if new_layer
            new_layer.user = current_user
            new_layer.name = "Filtered #{layer.name}"
            new_layer.save!
            open_project(params[:project_id]) { |project| new_layer.projects << project }
            render :json => new_layer
          else
            render :json => { :error => "Couldn't generate new Layer."}
          end
        end
      end
    end
  end
  
  private
  
  # this is temporary
  def get_random_color
    case (rand * 9).to_i
      when 0 then '#6699FF'
      when 1 then  '#000080'
      when 2 then '#ff8900'
      when 3 then '#66FF33'
      when 4 then '#996633'
      when 5 then '#008080'
      when 6 then '#9999cc'
      when 7 then '#bbbbbb'
      when 8 then '#CCFF66'
      end
  end
  
end
