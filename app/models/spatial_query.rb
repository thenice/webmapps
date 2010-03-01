class SpatialQuery

  # todo: use databaseayer
  # include DatabaseLayer

  # => spatial_query.rb (SpatialQuery)
  # => 
  # => The SpatialQuery class is intended for use with the PostGIS adapter
  # => for PostgreSQL version 8.3 and above. It alows the client to construct
  # => spatial queries on the fly, with a constructor that accepts all of
  # => the required fields to perform the query. To use this class, create
  # => a new instance of the SpatialQuery class, passing in a source table,
  # => a comparison table, and a comparison method. Optionally, the client
  # => can pass in a new layer name, and a new layer table name. This allows the
  # => client to call to_layer, which creates a new Webmapps Layer table and 
  # => layer record in the databse, returning the newly created layer object.
  # => 
  # => Authored April 22nd, 2009 by Daniel Cohen (daniel@danielcohendesigns.com)
  # => Written for use with the Webmapps framework (webmapps.com)
  
  attr_accessor :source, :compare, :method, :geom_column_name, :new_layer_name, :new_layer_table_name
  attr_reader :results
  
  # in order to create a spatial query,
  # the options hash must have at least:
  #
  # sourceLayer => id # of table
  # compareMethod => compare method to use: intersects, contains...
  # compareLayer => id # of compare table
  #
  def SpatialQuery.from_JSON(options = {})
    query = SpatialQuery.new
    query.source   = Layer.find(options['sourceLayerID'])
    query.method   = options['compareMethodName']
    query.compare  = Layer.find(options['compareLayerID'])
    query.new_layer_name = options['newLayerName']
    return query
  end
  
  def query
    if has_required_fields?
      "SELECT #{select} FROM #{@source.table_name} INNER JOIN #{compare.table_name} ON #{postgis_method}(#{@source.table_name}.#{@source.geometric_column_name}, #{@compare.table_name}.#{@source.geometric_column_name})"
    end
  end
  
  # select() allows the user to select which columns to include in the query.
  # currently, it just weeds out the compare layer's geometry field, so that
  # the source layer's geom is the one that get's included, rather than the compare
  # layer. this method is under construction...
  def select(fields = [])
    if fields.blank? and has_required_fields?
      source_selection = @source.classify.column_names.collect { |column| "#{@source.table_name}.\"#{column}\"" }
      compare_selection = @compare.classify.column_names.collect { |column| "#{@compare.table_name}.\"#{column}\"" }
      compare_selection.delete_if { |s|  s.include? @compare.geometric_column_name }
      [compare_selection, source_selection].each { |a| a.delete_if { |s| s.include? 'id' } }
      return (source_selection + compare_selection).join(',') 
    else
      return fields.join(',')
    end
  end
  
  # => Conditions expect array of hashes like this:
  # => [ {:field => 'field_name',
  # => :operator => '= | > | >= | < | <='},
  # => :value => 'comparison_value'}, ... ]
  def where(conditions = [])
  end
  
  # so execute can be called either as execute? or execute
  def execute
    return execute?
  end
  
  def execute?
    begin
      conn = ActiveRecord::Base.connection
      unless (@source.blank? or @method.blank? or @compare.blank?)
        @results = conn.execute(query) 
        return true
      else
        @results = nil
        return false
      end
    rescue
      # TODO: throw a spatial query exception
      puts "There was an error executing this query."
      @results = nil
      return false
    end
  end
  
  def to_layer
    generate_table_name
    if has_required_fields? and not [@new_layer_name, @new_layer_table_name].include? nil
      new_layer = Layer.new(:name => @new_layer_name, :table_name => @new_layer_table_name, :geometric_column_name => @source.geometric_column_name)
      create_table
      create_table_structure
      insert_data
      new_layer.save!
      return new_layer
    else
      return nil
    end
  end
  
  private
  
  # if the query has been executed, schema returns an array of hashes
  # [{column_name => 'col name', :column_type => 'rails db migration type'}, ... ]
  def schema
    unless @results.blank?
      scheme = Array.new
      @results.fields.each_with_index do |field_name, index| 
        scheme << { :column_name => field_name.downcase, :column_type => postgres_type(@results.type(index)) }
      end
      return scheme
    end
  end
  
  # "intersects"  =>  "ST_Intersects"
  # "InTersEcts"  =>  "ST_Intersects"
  def postgis_method
    @method.downcase.capitalize.insert(0,"ST_")
  end
  
  # creates a new table to hold a new layer
  def create_table
    ActiveRecord::Schema.create_table(@new_layer_table_name){} if table_has_unique_name?
  end
  
  # ensure table has unique name in the database
  def table_has_unique_name?
    unless @new_layer_table_name.blank?
      return ActiveRecord::Base.connection.execute("SELECT * FROM information_schema.tables WHERE \"table_name\" = '#{@new_layer_table_name}';").to_a.size == 0
    end
    return false
  end
  
  # expects an array of hashes (as returned from method schema) with field names and field types
  #
  # [ {:column_name => 'the_name_of_the_column', :column_type => 'integer'},
  #   {:column_name => 'another_name_of_a_column', :column_type => 'float'}
  # ]
  #
  def create_table_structure
    schema.each do |column|
      begin
        ActiveRecord::Schema.add_column(@new_layer_table_name, column[:column_name].downcase, column[:column_type])
      rescue
        # rescues an error, and continues to add columns, rather than stop
        puts "The column: #{column[:column_name]} with type #{column[:column_type]} could not be added.whoah."
      end
    end
  end
  
  # takes a PostgresResult type, and stores the results in
  # the newly created table.
  def insert_data
    column_names = results.fields
    table_name = @new_layer_table_name # here for scope issues with dynamic class...
    row = Class.new(ActiveRecord::Base) do
      set_table_name table_name
    end
    results.each do |result| 
      r = row.new
      result.each_with_index do |value, column_index|
        r[column_names[column_index].downcase] = value   
      end
      r.save
    end
  end
  
  # this looks at the Postgres internal OID number of a result column
  # to determine its type. The type is then matched with a Rails
  # database schema type. Defaults to String.
  def postgres_type(id)
    case id
     when 20..23 then :integer
     when (1015 or 1043) then :string
     when 16 then :boolean
     when 25 then :text
     when 700..701 then :float
     when 1002 then :character
     when 1082 then :date
     when 1114 then :datetime
     when 16402 then:geometry
    else 
      :string
    end
  end
  
  # checks to make sure an instance of SpatialQuery contains
  # values for all of the fields required to execute a query
  def has_required_fields?
    not [@source,  @method, @compare].include? nil
  end
  
  # generates a random name to be used for the layer's table
  def generate_table_name
    until table_has_unique_name? and @new_layer_table_name
      @new_layer_table_name = "layer_table_#{((rand*1000000000000000).to_i)}"
    end
  end
  

  
end