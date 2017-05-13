class CreateDocumentsTags < ActiveRecord::Migration[5.0]
  def change
    create_table :documents_tags do |t|
      t.references :tag, foreign_key: true
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
