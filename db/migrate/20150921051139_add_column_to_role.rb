class AddColumnToRole < ActiveRecord::Migration
  def change
    add_column :roles ,:name, :string
  end
end
