class ItemsController < ApplicationController    
    before_action :set_item, only: [:edit, :update, :destroy]
    before_action :authenticate_user!

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to items_path
    else
      render new_item_path
    end
  end

  def edit;end

  def update
    if @item.update(item_params)
       redirect_to items_path
    else
      render new_item_path
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    end
  end

  def search_item
    @items = Item.where("name like ?", "%#{params[:term]}%")
    render  json: @items
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :detail_of_item, :price, :portion, :type_of_item, :available)
  
    end

end