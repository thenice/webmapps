class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.column :user_id, :integer
      t.column :biography, :text
      t.column :street_address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :image, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
