class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :item_id
      t.float :quantity
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
