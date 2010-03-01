class CreateLayers < ActiveRecord::Migration
  def self.up
    create_table :layers do |t|
      t.column :name, :string
      t.column :table_name, :string
      t.column :permissions, :integer
      t.column :geometric_column_name, :string
      t.column :user_id, :integer
      t.column :category_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :layers
  end
end
