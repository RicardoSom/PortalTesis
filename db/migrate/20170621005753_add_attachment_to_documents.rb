class AddAttachmentToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :attachment, :string
  end
end
