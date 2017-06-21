class DeleteColumnsToDocuments < ActiveRecord::Migration[5.0]
  def change
      remove_column :documents , :namestudent
      remove_column :documents , :lastnamestudent
      remove_column :documents , :nameprofessor
      remove_column :documents , :lastnameprofessor
      remove_column :documents , :filepdf_id
      remove_column :documents , :career_id
      remove_column :documents , :user_id
      remove_column :documents , :school_id
  end
end
