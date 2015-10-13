class CustomersController < ApplicationController

  def index
    # @order = Order.where(status: "unpaid")
    @table = Table.where(available: false)
  end

end