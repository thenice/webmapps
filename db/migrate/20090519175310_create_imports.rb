class CreateImports < ActiveRecord::Migration
  def self.up
    create_table :imports do |t|
      t.string :format
      t.integer :reliability
      t.string :source
      t.string :external_url
      t.integer :user_id
      t.integer :layer_id
      t.string :title
      t.string :short_name

      t.timestamps
    end
  end

  def self.down
    drop_table :imports
  end
end
