class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|

      t.timestamps null: false
      t.integer :payment_number
      t.integer :payment_method_id
    end
  end
end
