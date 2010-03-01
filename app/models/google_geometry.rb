class ImportController < ApplicationController
  
  protect_from_forgery :secret => 'shhhhhhhhhhhhhhhhhh'
    
  def new
    @import = Import.new 
  end
  
  def create
    @import = Import.new(params[:import])
    if @import.save
      session[:import_id] = @import.id
      redirect_to :action => 'details'
    else
      render :action => 'new'
    end
  end


  def details
    @import = Import.find(session[:import_id])
    render :text => "let's get started importing @import.title"
  end

  def columns
  end
  
  def upload
  end

end
