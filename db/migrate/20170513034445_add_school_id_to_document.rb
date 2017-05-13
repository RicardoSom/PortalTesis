class AddSchoolIdToDocument < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :school, foreign_key: true
  end
end
