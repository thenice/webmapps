class CreateShapefiles < ActiveRecord::Migration
  def self.up
    create_table :shapefiles do |t|
      t.column :name, :string
      t.column :shp_filename, :string 
      t.column :shx_filename, :string
      t.column :dbf_filename, :string
      t.column :layer_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :shapefiles
  end
end
