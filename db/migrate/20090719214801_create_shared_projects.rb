class CreateSharedProjects < ActiveRecord::Migration
  def self.up
    create_table :shared_projects do |t|
      t.string :title
      t.text :welcome_text
      t.integer :deploy_port
      t.integer :project_id
      t.string :shared_layers_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :shared_projects
  end
end
