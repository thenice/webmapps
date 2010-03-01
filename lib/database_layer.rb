module DatabaseLayer
  
  #adds table prefix 'layer_' to each layer
  def new_table_name=(name)
    @new_table_name = "layer_table_#{name}"
  end
  
  # adds the layer to the layers table
  def add_layer
    Layer.create(:name => @new_table_name, :table_name => @new_table_name, :geometric_column_name => "the_geom")
  end
  
  # checks the database to ensure @new_table_name is unique 
  def table_has_unique_name?
    ActiveRecord::Base.connection.execute("SELECT * FROM information_schema.tables WHERE \"table_name\" = '#{@new_table_name}';").to_a.size == 0
  end
  
  # generates a random name to be used for the layer's table
  def generate_table_name
    until table_has_unique_name? and @new_table_name
      self.new_table_name = ((rand*1000000000000000).to_i).to_s
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
end