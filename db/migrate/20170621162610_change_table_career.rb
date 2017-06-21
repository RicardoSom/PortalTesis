class ChangeTableCareer < ActiveRecord::Migration[5.0]
  def change
      add_foreign_key :students, :careers,column: :career_id , primary_key: :id
      add_column :careers , :codigo , :integer
  end
end
