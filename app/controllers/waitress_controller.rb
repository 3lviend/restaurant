class WaitressController < ApplicationController
  
  before_action :set_waitress, only:[:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @role_w = Role.where(:name => "waitress").first
    @role_w = Role.find_by_name("waitress")
    @waitress = @role_w.users
    # @waitress = User.where(:role => "waitress")
    # @waitress = User.where(:role_id => 2)
    # @waitress = Role.where(:name => "waitress")
    # debugger
    # @waitress = Role.where(:name => "waitress")
    # user = User.all
  end

  def new
    @waitress = User.new
  end
  
  def create
    role_w = Role.find_by_name "waitress"
    params[:user][:role_] = role_w 
    @waitress = User.new(waitress_params)
    debugger
    if @waitress.save
      redirect_to waitress_index_path
    else
      render new_waitress_path
    end
  end

  def edit
    @role = Role.find_by_name('waitress')
  end

  def update
    if @waitress.update(waitress_params)
      redirect_to :waitress_index
    else
      render new_waitress_path
    end
  end

  def destroy
    if @waitress.destroy
      redirect_to waitress_index_path
   end  
  end

  def new_order
    @new_order = Order.new
    @item = Item.new
  end

  private

    def set_waitress
      @waitress = User.find(params[:id])
    end

    def waitress_params
      params.require(:user).permit(:email, :password, :role_id, :password_confirmation)
    end
end
