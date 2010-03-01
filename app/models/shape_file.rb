class ShapeFile
  
  include GeoRuby::Shp4r
  include PortableFiles
  
  attr_accessor :files, :columns
  attr_reader :shape_file, :new_table_name
  
  def initialize(options={})
    @files = {:shp_file => options[:shp_file], :shx_file => options[:shx_file], :dbf_file => options[:dbf_file] }
  end
  
  def read_columns
    @columns = Array.new
    each_column do |field|
      @columns << { :name => sanitize_name(field.name.downcase), :type => field_type_to_rails(field.type) }
    end
    @columns
  end
  
  # opens the shapefile and stores its data through creation of active record models
  def import_data(fields=[])
    puts "made it to import"
    cl = classify
    ShpFile.open(self) do |shp|
      shp.each do |shape|  
        record = cl.new
        shp.fields.each do |field|
          record[field.name.downcase] = shape.data[field.name] if fields.include? field.name.downcase or fields.blank?
        end
        record.the_geom = shape.geometry
        record.save     
      end
    end
  end
  
  def export_data
  end
  
  def each_column
    ShpFile.open(self) do |shp|
      shp.fields.each do |field|
        yield(field)
      end
    end
  end
  
  private
  
  def field_type_to_rails(type)
    case type
      when 'N' then :integer
      when 'F' then :float
      when 'D' then :date
    else
      :string
    end
  end 
  
end