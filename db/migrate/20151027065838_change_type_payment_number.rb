class ChangeTypePaymentNumber < ActiveRecord::Migration
  def change
    change_column :payments, :payment_number, :bigint 
  end
end
