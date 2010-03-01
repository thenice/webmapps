class CreateGroupsLayers < ActiveRecord::Migration
  def self.up
    create_table :groups_layers do |t|
      t.integer :group_id
      t.integer :layer_id
      t.timestamps
    end
  end

  def self.down
    drop_table :groups_layers
  end
end
