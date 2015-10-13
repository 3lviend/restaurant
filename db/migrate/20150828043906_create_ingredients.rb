class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :quantity
      t.string :detail_of_quantity

      t.timestamps null: false
    end
  end
end
