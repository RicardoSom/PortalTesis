class Borrarrutuser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users , :rut
  end
end
