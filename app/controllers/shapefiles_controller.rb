class ShapefilesController < ApplicationController
  
  def new
    @shapefile = Shapefile.new
  end
  
  def create
    @shapefile = Shapefile.new(params[:shp_filename], params[:shx_filename], params[:dbf_filename] )
    if @shapefile.save
      flash[:notice] = 'Shapefile was successfully created.'
      redirect_to :action => 'new'   
    else
      render :action => :new
    end
  end
end
