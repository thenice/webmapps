class CreateLayerFilters < ActiveRecord::Migration
  def self.up
    create_table :layer_filters do |t|
      t.integer :layer_id
      t.string :column_name
      t.string :operation
      t.string :value
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :layer_filters
  end
end
