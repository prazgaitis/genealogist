class AddCompletedAtToCompilations < ActiveRecord::Migration[5.2]
  def change
    add_column :compilations, :completed_at, :timestamp
  end
end
