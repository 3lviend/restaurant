class AddFieldsActiveToTableAdditionalAndPaymentMethod < ActiveRecord::Migration
  def change
    add_column :additionals,  :active, :boolean
    add_column :payment_methods,  :active, :boolean
  end
end
