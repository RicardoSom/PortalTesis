class CreateProfessors < ActiveRecord::Migration[5.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :rut

      t.timestamps
    end
  end
end
