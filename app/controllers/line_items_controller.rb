class LineItemsController < ApplicationController

  before_action :set_orders, only:[:edit]
  # before_action :set_line_items, only:[:edit_quantity]
  before_action :authenticate_user!
  
  def index;end

  def new
    @line_item = Order.create(:table_id => params[:table_id], :status => "unpaid").line_items.new
    @table = Table.update(params[:table_id], available: false);
  end

  def new_order_without_table
    @line_item = Order.create(:table_id => nil, :status => "unpaid").line_items.new
  end

  def edit;end
  
  def show;end

  def create
    counting = 0
    error = 0
    # message = []
    params[:line_items].each do |key, value|
      @line_items = LineItem.new(line_item_params(key))
      # counting += 1 if @line_item.save
      # error += 1 unless condition
      if @line_items.save
        counting +=1
      else
        error +=1
      end
    end

    if counting > 0
      order_id = []
      params[:line_items].each do |key|
        order_id << key[0]
      end

      new_order_id = order_id[0]
      redirect_to your_order_path(params[:line_items][new_order_id][:order_id])
    else
      redirect_to orders_path
    end
  end

  def update
   @line_item = LineItem.find(params[:id])
   if @line_item.update(edit_quantity_params)
      redirect_to edit_line_item_path(params[:line_item][:order_id])
    else
      render :back
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    if @line_item.destroy
      redirect_to :back
    end
  end
  
  def edit_quantity
      @line_item = LineItem.find(params[:line_item_id])
  end 

  private

    def set_line_items
      @line_item = LineItem.find(params[:line_item_id])
    end

    def set_orders
      @order = Order.find(params[:id])
    end

    def line_item_params(key)
      params[:line_items].require(key).permit(:order_id, :item_id, :quantity)
    end

    def edit_quantity_params
      params.require(:line_item).permit(:quantity, :item_id, :order_id)
    end
end
