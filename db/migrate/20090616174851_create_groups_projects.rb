class CreateGroupsProjects < ActiveRecord::Migration
  def self.up
    create_table :groups_projects do |t|
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :groups_projects
  end
end
