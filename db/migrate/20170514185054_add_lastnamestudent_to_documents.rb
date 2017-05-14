class AddLastnamestudentToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :lastnamestudent, :string
  end
end
