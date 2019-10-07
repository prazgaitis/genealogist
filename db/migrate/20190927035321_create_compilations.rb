class CreateCompilations < ActiveRecord::Migration[5.2]
  def change
    create_table :compilations do |t|
      t.integer :page_count
      t.string :url_id
      t.string :status
      t.string :uuid

      t.timestamps
    end
  end
end
