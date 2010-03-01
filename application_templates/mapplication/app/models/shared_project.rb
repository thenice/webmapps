class SharedProject < ActiveRecord::Base
  
  def layers_tables
    self.layers_table_names.split(",").each { |l| l.strip! }
  end
  
  def each_layer
    layers_tables.each do |table_name|
      yield Layer.new(table_name)
    end
  end
  
  def get_layer(i)
    begin
      layers.select { |layer| layer[:id] == i }.first[:layer]
    rescue
      return nil
    end
  end
          
  def layers
    layers=[]
    layers_tables.each_with_index do |t, i|
      layers << { :id => i, :layer => Layer.new(t).classify }
    end
    layers
  end
  
end