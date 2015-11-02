class CreateAdditionals < ActiveRecord::Migration
  def change
    create_table :additionals do |t|
      t.string :type
      t.float :amount

      t.timestamps null: false
    end
  end
end
