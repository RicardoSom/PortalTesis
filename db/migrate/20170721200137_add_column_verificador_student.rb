class AddColumnVerificadorStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :student_v, :integer
    add_column :documents, :professor_v, :integer
  end
end
