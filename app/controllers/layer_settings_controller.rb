class LayerSettingsController < ApplicationController
  # GET /layer_settings
  # GET /layer_settings.xml
  def index
    @layer_settings = LayerSetting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @layer_settings }
    end
  end

  # GET /layer_settings/1
  # GET /layer_settings/1.xml
  def show
    @layer_setting = LayerSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @layer_setting }
    end
  end

  # GET /layer_settings/new
  # GET /layer_settings/new.xml
  def new
    @layer_setting = LayerSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @layer_setting }
    end
  end

  # GET /layer_settings/1/edit
  def edit
    @layer_setting = LayerSetting.find(params[:id])
  end

  # POST /layer_settings
  # POST /layer_settings.xml
  def create
    @layer_setting = LayerSetting.new(params[:layer_setting])

    respond_to do |format|
      if @layer_setting.save
        flash[:notice] = 'LayerSetting was successfully created.'
        format.html { redirect_to(@layer_setting) }
        format.xml  { render :xml => @layer_setting, :status => :created, :location => @layer_setting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @layer_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /layer_settings/1
  # PUT /layer_settings/1.xml
  def update
    @layer_setting = LayerSetting.find(params[:id])

    respond_to do |format|
      if @layer_setting.update_attributes(params[:layer_setting])
        flash[:notice] = 'LayerSetting was successfully updated.'
        format.html { redirect_to(@layer_setting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @layer_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /layer_settings/1
  # DELETE /layer_settings/1.xml
  def destroy
    @layer_setting = LayerSetting.find(params[:id])
    @layer_setting.destroy

    respond_to do |format|
      format.html { redirect_to(layer_settings_url) }
      format.xml  { head :ok }
    end
  end
end
