class RenameRoleToRoleId < ActiveRecord::Migration
  def change
    rename_column :users, :role, :role_id
    change_column :users, :role_id, :integer
  end
end
