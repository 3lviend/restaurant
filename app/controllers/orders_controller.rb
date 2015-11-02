class OrdersController < ApplicationController

  before_action :set_order, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except:[:table_order_unpaid, :your_order, :orders_today]

  def index
    @table = Table.all
  end


  # def new
  #   @order = Order.new(:table_id => params[:id], :status => "unpaid").line_items.new
  #   @items = Item.all
  # end

  # def create
  #   @order = LineItem.new(order_params)
  #   if @order.save
  #     redirect_to orders_path
  #   end
  # end

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
    @order_unpaid_without_table = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is null").order("orders.table_id ASC")
  end

  def orders_today
    index
  end

  def table_order_unpaid
    # @order_table_unpaid = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is not null").order("orders.table_id ASC")
    # index
  end

  def your_order
    @your_order = Order.find(params[:id])
  end

  def get_payment_discount
    # @order = Order.update(params[:id], status: params[:status_order])
    # your_order = Order.find(params[:id]).id
    payment_type =  PaymentMethod.where(payment_type: params[:payment_type], active: true).first
    render json: payment_type.discount
  end

  def update_payment_method
    your_order = Order.find(params[:id])
    pay_id = Payment.find_by_order_id(your_order.id)
    your_order.payment.update(payment_method_id: params[:payment_method_id])
    your_order.update(total_payment: params[:total_payment], status: "paid")
    your_order.table.update(available: true)
    @payment = Payment.update(pay_id, payment_number: params[:payment_number])
    
    render json: @payment
  end

  def get_additional
    @additional = Additional.all
    render json: @additional
  end
  
  # def get_discount
  #   # Order.last.payment.payment_method.payment_type
  #   # payment_type_id = Order.find(params[:id]).payment.payment_method.id
  #   @discount = PaymentMethod.find_by_payment_type(params[:payment_method]).discount
  #   render json: @discount
  # end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:item_id, :quantity, :order_id)
    end
end
