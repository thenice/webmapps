class AddUserRelationToSharedProject < ActiveRecord::Migration
  def self.up
    add_column :shared_projects, :user_id, :integer
  end

  def self.down
    remove_column :shared_projects, :user_id
  end
end
