class RenameTableidxToTableid < ActiveRecord::Migration
  def change
    rename_column :orders, :table_idx, :table_id
    change_column :orders, :table_id, :integer
  end
end
