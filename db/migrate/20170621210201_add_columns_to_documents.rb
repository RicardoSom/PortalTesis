class AddColumnsToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :user_id, :integer
    add_column :documents, :professor_id, :integer
    add_column :documents, :student_id, :integer
    add_foreign_key :documents, :users, column: :user_id, primary_key: :id
    add_foreign_key :documents, :professors, column: :professor_id, primary_key: :id
    add_foreign_key :documents, :students, column: :student_id, primary_key: :id
  end
end
