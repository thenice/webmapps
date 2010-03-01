class CreateLayerMetadatas < ActiveRecord::Migration
  def self.up
    create_table :layer_metadatas do |t|
      t.integer :layer_id
      t.text :description
      t.integer :revision_number
      t.integer :reliability_rating
      t.string :source
      t.string :external_url
      t.text :collected_by

      t.timestamps
    end
  end

  def self.down
    drop_table :layer_metadatas
  end
end
