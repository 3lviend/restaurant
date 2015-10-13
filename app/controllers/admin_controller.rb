class AdminController < ApplicationController
before_action :authenticate_user!  
  def index
    @item = Item.limit(5)
    @ingredient = Ingredient.limit(5)
    @table = Table.limit(5)
    @order = Order.limit(5)
  end

  def orders
    # rescue "as"
    @order = Order.all.order("id DESC")

  end

  # def get_update_paid
  #   @paid = Order.find(params[:id])
  # end
  
  # def update_paid
  #   @paid = Order.find(params[:id])
  #   unless @paid.table.blank?
  #     table = @paid.table.update(:available => true)
  #   end
  #   if @paid.update(params_order)
  #     redirect_to admin_orders_path
  #   else
  #     redirect_to :back
  #   end
  # end

  private

  def params_order
    params.require(:order).permit(:status)
  end

end
