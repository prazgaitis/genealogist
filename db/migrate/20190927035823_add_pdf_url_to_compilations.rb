class AddPdfUrlToCompilations < ActiveRecord::Migration[5.2]
  def change
    add_column :compilations, :pdf_url, :string
  end
end
