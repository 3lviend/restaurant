module Api
	class OrdersController < Api::BaseController
		
		def index
			@table = Table.all
			render json: @table
		end

		def show
			@table = Table.find(params[:id])
      render :json => @table
    end

    def order_unpaid_without_table
	    @order_unpaid_without_table = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is null").order("orders.table_id ASC")
	    render :json => @order_unpaid_without_table
	  end

	  def show_detail_order_unpaid_without_table
      @your_order = Order.find(params[:id])
      render :json => @your_order
  	end

	end
end