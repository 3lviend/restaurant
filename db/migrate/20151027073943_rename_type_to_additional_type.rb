class RenameTypeToAdditionalType < ActiveRecord::Migration
  def change
    rename_column :additionals, :type, :additional_type
  end
end
