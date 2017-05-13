class AddCareerIdToDocument < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :career, foreign_key: true
  end
end
