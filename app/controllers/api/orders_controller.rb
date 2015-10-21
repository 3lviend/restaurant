module Api
	class OrdersController < Api::BaseController
		before_action :get_order, only:[:show_detail_order_with_table, :show_detail_order_without_table]

		def index
			@table = Table.where(available: true)
			render json: @table
		end

		def show
			@table = Table.find(params[:id])
      render :json => @table
    end

    def order_with_table
	    @order_with_table = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is not null").order("orders.table_id ASC")
	    render :json => @order_with_table
	  end

	  def show_detail_order_with_table
      render :json => @order
  	end

    def order_without_table
	    @order_without_table = Order.includes(:table, :line_items).where("orders.status = 'unpaid' and orders.table_id is null").order("orders.table_id ASC")
	    render :json => @order_without_table
	  end

	  def show_detail_order_without_table
      render :json => @order
  	end

  	private
    def get_order
      @order = Order.find(params[:id])
    end

	end
end