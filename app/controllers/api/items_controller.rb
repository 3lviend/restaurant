module Api
	class ItemsController < Api::BaseController
		# before_action :set_item, only: [:edit, :update, :destroy]

	  def index
	    @item = Item.all
	    render json: @item
	  end

	  def show
	  	@item = Item.find(params[:id])
	  	render json: @item
	  end

	  # def create
	  #   @item = Item.new(item_params)
	  #   if @item.save
	  #       redirect_to items_path
	  #   else
	  #     render new_item_path
	  #   end
	  # end

	  def update
	    # debugger
	    render json: {status:true}, status: 200
	  end

	  # def destroy
	  #   if @item.destroy
	  #     redirect_to items_path
	  #   end
	  # end

	  # private
	  # def set_item
	  #   @item = Item.find(params[:id])
	  # end

	  # def item_params
	  #   params.require(:item).permit(:name, :detail_of_item, :price, :portion, :type_of_item, :available)

	  # end

	end
end