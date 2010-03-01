class Layer < ActiveRecord::Base
  
  belongs_to :user
  has_one :shapefile
  has_one :layer_metadata
  has_and_belongs_to_many :groups
  has_many :layer_projects
  has_many :projects, :through => :layer_projects
  has_many :features
  has_many :layer_filters
  has_one :layer_setting
  
  before_create :ensure_dependencies
  
  include DatabaseLayer
  extend Pagination
  
  # dynamically generate the layer in an active record object enabled with spatial behavior
  def classify
    table_name = self.table_name # scope limitations
    class_name = self.name.split(" ").join("_").camelcase.capitalize
    # this eval statement prevents the dynamically created class from becoming an anonymous class
    eval "Class.new ActiveRecord::Base do
      set_table_name table_name
      acts_as_spatial
      extend Pagination
    end"
  end
  
  def ensure_dependencies
    unless self.layer_metadata
      self.layer_metadata = LayerMetadata.new
      self.layer_setting = LayerSetting.new
    end
  end
  
  # takes an id of a layer, returns an array of column names for that layer
  def self.get_fields(id)
    begin
      layer = self.find(id)
      layer.classify.column_names
    rescue
      return nil
    end
  end 
  
  # returns all users with access to this project, including the owner
  def all_users
   users = self.projects.inject([])  { |r,project| r << project.users.collect { |u| u.id } << project.owner.id }.flatten 
   User.find(users)
  end
  
  # returns all features in an attribute hash
  # if option :filtered is true, results will be filtered with layer_filters
  # if filter causes an exception then results without filter applied will be returned.
  # if :omit_geom is specified, the geom column will not be queried
  def features(options = {})
    columns = (options[:omit_geom]) ? column_names(:omit_geom => true) : column_names
    if (options[:filtered])
      begin
        features = self.classify.find(:all, :select => columns.join(","), :conditions => filtered_features_query)
      rescue
        features = self.classify.find(:all, :select => columns.join(","))
      end     
    else
      features = self.classify.find(:all, :select => columns.join(","))
    end
    features.collect { |f| f.attributes }
  end
  
  #returns hash of column names for the layer, options: :omit_geom
  def column_names(options = {})
    columns = self.classify.column_names
    if options[:omit_geom]
      columns.delete_if { |name| name == self.geometric_column_name }
    else
      columns
    end 
  end
  
  def layer_from_filters
    begin
      @columns = self.classify.columns.collect { |column| {:name => column.name, :type => column.type} }
      generate_table_name
      create_table
      create_table_structure(column_names(:omit_geom => true)) # geom already included in table generation
      new_layer = add_layer
      puts "new layer created: " + new_layer.inspect
      self.features(:filtered => true).each do |feature|
        debugger
        new_feature = new_layer.classify.new(feature)
        new_feature.save!
      end
      return new_layer
    rescue
      # deal with errors here..
      return nil
    end
  end

  def has_buffer?
    not self.layer_setting.blank?
  end

  def geom_with_buffer
    if has_buffer?
      buffer = self.classify.buffer(self.layer_setting.buffer_size)
      geom_with_buffer = ActiveRecord::Base.connection.execute("select astext( geomunion ( geomunion(geomfromtext(astext(#{self.geometric_column_name}),4326)), geomfromtext(\'#{buffer.as_wkt}\', 4326) )) from \"#{self.table_name}\"  ;")[0][0]
      Polygon.from_ewkt(geom_with_buffer)
    else
      nil
    end
  end
  
  private
  
  # returns the query accounting for all filters applied to this layer
  def filtered_features_query
    self.layer_filters.collect { |filter| "\"#{filter.column_name}\" #{filter.operation} '#{filter.value}'"}.join(" AND ")
  end
  
  

end
