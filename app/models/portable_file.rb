class PortableFile
  
  def initialize(type)
    case type.downcase
      when 'csv' then extend FileFormats::CSVFile
      when 'shapefile' then extend FileFormats::Shapefile
    end
  end
  
end