module upload
  
  def uploaded_file(file_from_params)
    if file_from_params.kind_of? StringIO
      uploadedFile.rewind
      @realFile = Tempfile.new("shapefile")
      while not uploadedFile.eof? 
        @realFile.write uploadedFile.read
      end
    else
      @realFile = uploadedFile
    end
  end
  
end