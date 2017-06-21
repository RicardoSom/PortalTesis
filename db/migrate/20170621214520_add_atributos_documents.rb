class AddAtributosDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents , :rut_student, :string
    add_column :documents , :rut_professor, :string
  end
end
