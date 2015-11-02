class ChangeTypeToPaymentType < ActiveRecord::Migration
  def change
   rename_column :payment_methods, :type, :payment_type
  end
end
