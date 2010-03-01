module PortableFiles
  
 attr_accessor :file_paths
  
  #adds table prefix 'layer_' to each layer
  def new_table_name=(name)
    @new_table_name = "layer_table_#{name}"
  end
  
  # adds the layer to the layers table
  def add_layer
    puts "made it to PL add layer"
    Layer.create(:name => @new_table_name, :table_name => @new_table_name, :geometric_column_name => "the_geom")
  end
  
  # checks the database to ensure @new_table_name is unique 
  def table_has_unique_name?
    ActiveRecord::Base.connection.execute("SELECT * FROM information_schema.tables WHERE \"table_name\" = '#{@new_table_name}';").to_a.size == 0
  end
  
  # generates a random name to be used for the layer's table
  def generate_table_name
    until table_has_unique_name? and @new_table_name
      self.new_table_name = ((rand*10000000000000).to_i).to_s
    end
  end
  
  # creates a table if @new_table_name has been defined. Does not check if @new_table_name is unique
  def create_table
    # empty block : the columns will be added afterwards
    unless @new_table_name.blank?
      ActiveRecord::Schema.create_table(@new_table_name){}
      @table_created = true
    end
  end
  
  # if the table has been created, this method generates the schema for the importable file and writes it to the databse
  # if an exception results from attempting to add a column, the exception is caught and logged. ::the_geom spatially indexed
  # ignores @param columns_to_include if it is nil, otherwise columns_to_include is an array, of column names. only these will be included
  def create_table_structure(columns_to_include)
    if @table_created
      @columns.each do |column|
        begin
          ActiveRecord::Schema.add_column(@new_table_name, column[:name], column[:type]) if (columns_to_include.blank? or columns_to_include.include? column[:name])
        rescue
          puts "Couldnt add field #{column[:name].downcase}"
        end
      end
      ActiveRecord::Schema.add_column(@new_table_name,"the_geom", :geometry,:null => false)
      ActiveRecord::Schema.add_index(@new_table_name,"the_geom",:spatial => true)
    end
  end
  
  # dynamically generates a class inherited from active record with access to the current layer's data columns
  def classify
    temp_table_name = self.new_table_name
    Class.new(ActiveRecord::Base) do
      set_table_name temp_table_name
      acts_as_spatial :attach_geocoder => true
    end
  end

  # takes the contents of the files hash and copies them from temp files
  # and stores them in /temp_uploads. On upload, filename should get a random seed prefixed
  # to the filename, but i've added an extra 4 digit random seed to each filename just for
  # extra protection. returns a hash with paths pointing to files as values. this is a workaround
  # because you cant store files in the session variable. 
  def copy_files
    require 'ftools'
    @files.inject({}) do |result, file|
      seed = (rand * 1000).to_i
      new_path = "temp_uploads/#{seed}" + file[1].path.split('/').last
      File.move(file[1].path, new_path, true)
      result[file[0].to_sym] = new_path
      result
    end
  end
  
  # sets ::@files nil
  def clear_files
    @files = nil
  end
  
  # copies files to temp_uploads and then stores the new path in instance variable @file_paths
  def prepare_for_session
    @file_paths = copy_files
    clear_files
  end
  
  # fix the titles people give columns...
  def sanitize_name(name)
    name.gsub!(' ', '_')
    name.downcase!
    name.gsub!('-', '_')
    name.gsub!('\'', '_')
    name
  end
  
end