class LayerFiltersController < ApplicationController
  # GET /layer_filters
  # GET /layer_filters.xml
  
  require 'JSON'
  
  def index
    @layer_filters = LayerFilter.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @layer_filters }
      format.json { render :json => @layer_filters }
    end
  end

  # GET /layer_filters/1
  # GET /layer_filters/1.xml
  def show
    @layer_filter = LayerFilter.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @layer_filter }
      format.json  { render :json => @layer_filter }
    end
  end

  # GET layer_filters/new
  # GET /layer_filters/new.xml
  def new
    @layer_filter = LayerFilter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @layer_filter }
      format.json  { render :json => @layer_filter }
    end
  end

  # GET /layer_filters/1/edit
  def edit
    @layer_filter = LayerFilter.find(params[:id])
  end

  # POST /layer_filters
  # POST /layer_filters.xml
  def create
    @layer_filter = LayerFilter.new(params[:layer_filter])
    respond_to do |format|
      if @layer_filter.save
        flash[:notice] = 'LayerFilter was successfully created.'
        format.html { redirect_to(@layer_filter) }
        format.xml  { render :xml => @layer_filter, :status => :created, :location => @layer_filter }
        format.json  { render :json => @layer_filter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @layer_filter.errors, :status => :unprocessable_entity }
        format.json  { render :json => @layer_filter.errors }
      end
    end
  end

  # PUT /layer_filters/1
  # PUT /layer_filters/1.xml
  def update
    @layer_filter = LayerFilter.find(params[:id])

    respond_to do |format|
      if @layer_filter.update_attributes(params[:layer_filter])
        flash[:notice] = 'LayerFilter was successfully updated.'
        format.html { redirect_to(@layer_filter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @layer_filter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /layer_filters/1
  # DELETE /layer_filters/1.xml
  def destroy
    @layer_filter = LayerFilter.find(params[:id])
    @layer_filter.destroy

    respond_to do |format|
      format.html { redirect_to(layer_filters_url) }
      format.xml  { head :ok }
      format.json  { render :json => @layer_filter.attributes }
    end
  end
end
