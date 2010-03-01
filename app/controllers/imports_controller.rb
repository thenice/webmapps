class ImportsController < ApplicationController
  
  layout 'popup'
  
  before_filter :set_tab
  
  protect_from_forgery :secret => "secret"
  
  def set_tab
    session[:project_tab] = "layers"
  end
  
  def index
    redirect_to import_new_layer_url(params[:id])
  end
  
  def new
    open_project(params[:id]) do |project|
      # reset any old import session
      session[:import_id] = nil
      session[:csv_file] = nil
      @title = "Import a layer into #{project.title}"
      @import = Import.new
      @project = project
    end
  end
  
  def create
    @import = Import.new (params[:import])
    if @import.save
      session[:import_id] = @import.id
      redirect_to :action => 'details'
    else 
      flash[:error] = "There was an error. Please try again."
    end
  end
  
  def details
      unless session[:import_id].blank?
        @import = Import.find(session[:import_id])
        open_project(@import.project_id) do |project|
          @title = "Import a layer into #{project.title}"
          @project = project
        end
      else
        redirect_to :action => 'new'
      end
  end
  
  def save_details
    unless session[:import_id].blank?
      @import = Import.find(session[:import_id])
      @import.attributes = params[:import]
      if @import.save
        redirect_to :action => 'upload'
      else
        flash[:error] = "there was an error"
      end
    else
      redirect_to :action => 'new'
    end
  end
  
  def upload
    unless session[:import_id].blank?
      @import = Import.find(session[:import_id])
      open_project(@import.project_id) do |project|
         @title = "Import a layer into #{project.title}"
         @project = project
       end
    else
      redirect_to :action => 'new'
    end
  end
  
  def process_shapefile_upload  
    unless session[:import_id].blank?
      @import = Import.find(session[:import_id])
      unless [params[:shp_file], params[:shx_file], params[:dbf_file]].include? nil
        shp,shx,dbf = ensure_file(params[:shp_file]), ensure_file(params[:shx_file]), ensure_file(params[:dbf_file])
        shapefile = ShapeFile.new(:shp_file => shp, :shx_file => shx, :dbf_file => dbf)
        shapefile.prepare_for_session
        paths = shapefile.file_paths
        session[:shp_file], session[:shx_file], session[:dbf_file] = paths[:shp_file], paths[:shx_file], paths[:dbf_file]
        redirect_to :action => 'select_columns'
      else
        flash[:error] = "Missing some files or something."
      end
    else
      redirect_to :action => 'new'
    end
  end
  
  def process_csv_upload
    unless session[:import_id].blank?
      @import = Import.find(session[:import_id])
      unless params[:csv_file].blank?
        file = ensure_file(params[:csv_file])
        csv_file = CSVFile.from_file(file)
        session[:csv_file] = csv_file
        redirect_to :action => 'select_columns'
      else
        flash[:error] = "Missing some files or something."
      end
    else
      redirect_to :action => 'new'
    end
  end
  
  def select_columns
    @import = Import.find(session[:import_id])
    open_project(@import.project_id) { |project| @project = project }
    portable_file = retrieve_portable_file_from_session
    @columns = portable_file.read_columns
  end
  
  def process_columns
    begin
      @import = Import.find(session[:import_id])
      portable_file = retrieve_portable_file_from_session
      columns = params[:included_columns]
      portable_file.read_columns
      portable_file.generate_table_name
      portable_file.create_table
      portable_file.create_table_structure(columns)
      portable_file.import_data(columns)
      layer = portable_file.add_layer
      layer.name = @import.title
      layer.layer_metadata = LayerMetadata.new(:source => @import.source,
        :reliability_rating => @import.reliability,
        :external_url => @import.external_url)
      layer.save
      open_project(@import.project_id) { |project| project.layers << layer }
      flash[:head] = "Layer Created."
      flash[:notice] = "The Layer #{@import.title} was imported." 
      redirect_to :controller => 'projects', :action => 'layers', :id => @import.project_id
    rescue
      flash[:head] = "There was an error importing your layer."
      flash[:error] = "Please check your import file and try again."
      redirect_to dashboard_url
    end
  end
  
  def success
    render :text => 'layer imported.'
  end
  
  private
  
  # ensures that the file returned from an upload field is a Tempfile (or File... same diff for our purposes)
  def ensure_file(input)
    if input.kind_of? StringIO
      file = Tempfile.new('tempfile')
      input.binmode if input.respond_to? :binmode
      file.write input.read
      file.rewind
      puts "filllleeee!!!!!! hereyago" + file.read
      return file
    else
      puts "RETTTTURNNNRRD NOTTT AAA STTRINGGGIIIOOOO"
      return input
    end
  end
  
  def retrieve_portable_file_from_session
    if session[:csv_file]
     file = session[:csv_file]
     file.read_columns
    elsif session[:shp_file]
      shp,shx,dbf = File.new(session[:shp_file]), File.new(session[:shx_file]),File.new(session[:dbf_file])
      file = ShapeFile.new(:shp_file => shp, :shx_file => shx, :dbf_file => dbf)
    end
    return file
  end
  
end
