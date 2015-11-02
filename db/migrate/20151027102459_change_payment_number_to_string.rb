class ChangePaymentNumberToString < ActiveRecord::Migration
  def change
    change_column :payments, :payment_number, :string
  end
end
