class CreateLayerSettings < ActiveRecord::Migration
  def self.up
    create_table :layer_settings do |t|
      t.float :buffer_size
      t.string :buffer_fill_color
      t.string :buffer_stroke_color
      t.string :fill_color
      t.string :stroke_color
      t.float :stroke_weight
      t.float :opacity
      t.integer :layer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :layer_settings
  end
end
