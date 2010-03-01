class Layer
  
  attr_accessor :table_name
  
  def initialize(table_name)
    @table_name = table_name
  end
  
  def classify
    table_name = self.table_name
    Class.new(ActiveRecord::Base) do
      set_table_name table_name
      acts_as_spatial
      extend Pagination
    end
  end
  
  def Layer.get_name(table_name)
    begin
      ActiveRecord::Base.connection.execute("SELECT layers.name FROM \"layers\" WHERE (layers.\"table_name\" = '#{table_name}') LIMIT 1")[0][0]
    rescue NoMethodError
      return nil
    end
  end
  
end