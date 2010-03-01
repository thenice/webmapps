class RenameFormatInImport < ActiveRecord::Migration
  def self.up
    rename_column :imports, :format, :file_format
  end

  def self.down
    rename_column :imports, :file_format, :format
  end
end
