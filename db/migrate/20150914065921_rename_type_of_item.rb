class RenameTypeOfItem < ActiveRecord::Migration
  def change
    rename_column :items, :type, :type_of_item
  end
end
