class AddProjectIdToImportTable < ActiveRecord::Migration
  def self.up
    add_column :imports, :project_id, :integer
  end

  def self.down
    remove_column :imports, :project_id
  end
end
