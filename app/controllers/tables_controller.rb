class TablesController < ApplicationController
  before_action :set_item, only:[:edit, :update, :destroy, :show]
  before_action :authenticate_user!
  before_action :current_user_admin?
  
  include ApplicationHelper
  
  def index
      @table = Table.all 
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path
    else
      render new_table_path
    end
  end

  def edit;end

  def update
    if @table.update(table_params)
      redirect_to tables_path
    else
      render new_table_path
    end

  end

  def destroy
    if @table.destroy
      redirect_to tables_path
    end
  end

  def show
    # @table 
  end


  private

    def set_item
      @table = Table.find(params[:id])
    end

    def table_params
      params.require(:table).permit(:name, :available)
    end
  
end
