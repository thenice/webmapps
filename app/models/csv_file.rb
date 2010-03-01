class CSVFile

  require "csv"
  include PortableFiles
  
  attr_accessor :data, :columns
  attr_reader  :new_table_name
  
  def CSVFile.from_file(file)
    begin
      newcsv = CSVFile.new
      file.rewind
      newcsv.data = CSV::IOReader.new(file).to_a
      return newcsv
    rescue
      raise CSVLoadError "There was an error parsing the supplied CSV File."
    end
  end
  
  def read_columns
    (@columns.blank?) ? (@columns = @data[0].compact.collect { |column_name| { :name => sanitize_name(column_name), :type => :string } }) : (@columns)
  end
    
  def import_data(fields=[])
    cl = classify
    each_row do |row, row_counter|
      item = cl.new
      row.each_with_index do |field, field_counter|
        item[columns[field_counter][:name]] = @data[row_counter][field_counter].strip if field_counter < columns.size
      end
      item.save
    end
    # this converts all of the imported rows x/y or longitude/latitude columns values
    # into an actualy binary geom.. there is no need to go through each row again.
    # TODO: this should be included in the above method... 
    cl.discover_georeference # from acts_as_spatial plugin
  end
  
  def count
    @data.size - 1 # -1 for header row
  end
  
  def each_row
    (1..(@data.size-1)).each do |index|
      begin
        yield(@data[index], index)
      rescue NoMethodError
        "Couldn't read row #{index}"
      end
    end
  end
  

  
end