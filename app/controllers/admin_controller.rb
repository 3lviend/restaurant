class AdminController < ApplicationController
before_action :authenticate_user!  
  def index
    @item = Item.limit(5)
    @ingredient = Ingredient.limit(5)
    @table = Table.limit(5)
    @order = Order.limit(5)
  end

  def orders
    @order = Order.all.order("id DESC")
  end
  
  def reports
    @reports = Order.search(params[:search])
  end

  private

  def params_order
    params.require(:order).permit(:status)
  end


end
