class Deletecolumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents , :datepublished
  end
end
