class RenameCompilationUrlIdToUrlIdentifier < ActiveRecord::Migration[5.2]
  def change
    rename_column :compilations, :url_id, :url_identifier
  end
end
