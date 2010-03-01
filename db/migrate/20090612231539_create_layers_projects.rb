class CreateLayersProjects < ActiveRecord::Migration
  def self.up
    # later changed to layer_projects from layers_projects
    # because the app was looking for that table...
    create_table :layer_projects do |t|
      t.integer :layer_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :layer_projects
  end
end
