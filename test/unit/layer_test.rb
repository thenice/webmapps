require 'test_helper'

# Tests for Layer, and associated models, like Shapefile...

class LayerTest < ActiveSupport::TestCase

  
  def test_layer_should_be_valid
    layer = create
    assert layer.valid?, "Layer was invalid. Layer: \n #{layer.to_yaml}"
  end
  
  def test_should_have_corresponding_layer_table
  end

  #importing shapefiles
  def test_presence_of_required_fields_after_shapefile_import
    @shapefile_layer = layer_from_shapefile
    assert_not_nil @shapefile_layer.table_name, "Table name field can't be blank"
    assert_not_nil @shapefile_layer.geometric_column_name, "Geometric column field can't be blank"
    #assert_not_nil @shapefile_layer.user, "Layer must belong to a user"
  end
  
  def test_layer_should_be_valid_after_shapefile_import
    @shapefile_layer = layer_from_shapefile
    assert_not_nil @shapefile_layer.classify.table_name, "Layer's classified object must have access to an individual table."
    assert_not_equal 0, @shapefile_layer.classify.columns.count, "Layer should have recieved columns at import" 
  end
  
  def test_layer_returns
  end
  private
  
  def create(options = {})
    Layer.create({
      :table_name => 'layer_test_layer',
      :geometric_column_name => 'the_geom'
    }.merge(options))
  end
  
  def layer_from_shapefile
    shapefile = ShapeFile.new
    shapefile.shp_file = File.new('test/test_files/shp7515.shp')
    shapefile.shx_file = File.new('test/test_files/shp7515.shx')
    shapefile.dbf_file = File.new('test/test_files/shp7515.dbf')
    shapefile.table_name = 'layer_test'
    return shapefile.save
  end
  
end
