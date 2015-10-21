class OrdersController < ApplicationController

  before_action :set_order, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except:[:table_order_unpaid, :your_order]

  def index
    @table = Table.all
  end


  def new
    @order = Order.new(:table_id => params[:id], :status => "unpaid").line_items.new
    @items = Item.all
  end

  def create
    @order = LineItem.new(order_params)
    if @order.save
      redirect_to orders_path
    end
  end

  def edit;end

  def update
    if @order.update(order_params)
      redirect_to orders_path
    end
  end

  def destroy
    if @order.destroy
      redirect_to orders_path
    end
  end
  
  def show;end 
  
  def get_update_paid
    @paid = Order.find(params[:id])
  end

  def update_status_order
    @order = Order.update(params[:id], status: params[:status_order])
    unless @order.table_id.nil?
      @order.table.update(available: true)
    end
    render json: @order
  end

  def warning
    @order_warning = Order.where(:status => "unpaid", :table_id => nil)
  end

  def order_unpaid_without_table
    # @order_unpaid_without_table = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is null").order("orders.table_id ASC")
  end

  def table_order_unpaid
    @order_table_unpaid = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is not null").order("orders.table_id ASC")   
  end

  
  def your_order
    @your_order = Order.find(params[:id])
  end



  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:item_id, :quantity, :order_id)
    end
end
