class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :detail_of_item
      t.decimal :price
      t.integer :portion
      t.string :type
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end
