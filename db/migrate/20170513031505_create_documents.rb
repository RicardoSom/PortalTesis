class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :abstract
      t.string :namestudent
      t.string :nameprofessor
      t.string :lastnameprofessor
      t.date :datepublished

      t.timestamps
    end
  end
end
