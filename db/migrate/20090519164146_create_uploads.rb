class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :file_name
      t.string :file_content_type
      t.integer :file_size
      t.integer :user_id
      t.string :processed
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
