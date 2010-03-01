class EditSharedProjectLayerFromIdToTableName < ActiveRecord::Migration
  def self.up
    remove_column(:shared_projects, :shared_layers_ids)
    add_column(:shared_projects, :layers_table_names, :string)
  end

  def self.down
    remove_column(:shared_projects, :layers_table_names)
    add_column(:shared_projects, :shared_layers_ids, :string)
  end
end
