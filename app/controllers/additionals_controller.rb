class AdditionalsController < ApplicationController

  before_action :set_additional, only:[:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :current_user_admin?
  
  include ApplicationHelper
  
  def index
      @additionals = Additional.all 
  end

  def new
    @additional = Additional.new
  end

  def create
    @additional = Additional.new(additional_params)
    if @additional.save
      redirect_to additionals_path
    else
      render new_additional_path
    end
  end

  def edit;end

  def update
    if @additional.update(additional_params)
      redirect_to additionals_path
    else
      render new_additional_path
    end

  end

  def destroy
    if @additional.destroy
      redirect_to additionals_path
    end
  end

  # def show;end


  private

    def set_additional
      @additional = Additional.find(params[:id])
    end

    def additional_params
      params.require(:additional).permit(:additional_type, :amount, :active)
    end
  
end