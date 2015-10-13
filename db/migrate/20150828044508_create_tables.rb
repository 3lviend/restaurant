class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.boolean :available, default: true

      t.timestamps null: false
    end
  end
end
