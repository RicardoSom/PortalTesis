class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :rut
      t.string :email
      t.integer :career_id

      t.timestamps
    end
  end
end
