class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :table_idx
      t.string :status

      t.timestamps null: false
    end
  end
end
