class LineItemsController < ApplicationController

  before_action :set_line_items, only:[:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index;end

  def new
    @line_item = Order.create(:table_id => params[:table_id], :status => "unpaid").line_items.new
    @table = Table.update(params[:table_id], available: false);
  end

  def new_order_without_table
    @line_item = Order.create(:table_id => nil, :status => "unpaid").line_items.new
  end

  def edit
  end
  
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
      # redirect_to your_order
      redirect_to orders_path
    else
      redirect_to :back
    end
  end

  # def update
  #   if @ingredient.update(ingredient_params) 
  #      redirect_to ingredients_path
  #   else
  #     render new_ingredient_path
  #   end
  # end

  def update
    count_update = 0
    error_update = 0
    params[:line_items].each do |key, value|
      if @line_items.update(line_item_params(key))
        count_update += 1
      else
        error +=1
      end
    end
    if count_update > 0
      redirect_to orders_path
    else
      redirect_to :back
    end
  end

  def destroy
    
  end

  private

    def set_line_items
      @line_item = Order.find(params[:id])
    end

  def line_item_params(key)
    params[:line_items].require(key).permit(:order_id, :item_id, :quantity)
  end
  # {"utf8"=>"✓", "authenticity_token"=>"jOUW9ZHNlo+LlRg1zgX6eRCnE40owAIgMWOaYxp3OOWaDCrh4oBYDCFab1olmOvEGzVludAmX//oojMc3d1haA==",
  # "line_items"=>
  # {
  # "2"=>{"order_id"=>"<%= @line_item.order_id %>", "item_id"=>"2", "quantity"=>"2"},
  # "4"=>{"order_id"=>"<%= @line_item.order_id %>", "item_id"=>"4", "quantity"=>"2"},
  # "6"=>{"order_id"=>"<%= @line_item.order_id %>", "item_id"=>"6", "quantity"=>"2"}
  # },
  # "controller"=>"line_items", "action"=>"create"}


end
