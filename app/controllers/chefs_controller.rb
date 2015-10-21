class ChefsController < ApplicationController
  
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :set_params, only:[:edit, :update, :destroy]
  
  def index
    @unpaid = Order.where(:status => "unpaid").where.not(:table_id => "nil")
    # @unpaid = Table
  end

  def edit;end

  def new
    @chef = User.new
  end

  def create 
    role_c = Role.find_by_name(:chef)
    params[:user][:role_id] = role_c.id
    @chef = User.new(chef_params)
    if @chef.save
      redirect_to admin_chefs_path
    else
      render new_chef_path
      
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to admin_chefs_path
    else
      render new_chef_path
    end
  end

  def destroy
    if @chef.destroy
      redirect_to admin_chefs_path
    end
  end
  
  def update_status_item
    @items = LineItem.update(params[:id], complete: params[:status_item])
      render json: @items
  end

  def all_chef
    @role_c = Role.find_by_name(:chef)
    @chef = @role_c.users
  end

  private

  def set_params
    @chef = User.find(params[:id])
  end

  def chef_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end
end
