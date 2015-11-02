class PaymentMethodsController < ApplicationController
    

  before_action :set_payment_method, only:[:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :current_user_admin?
  
  include ApplicationHelper
  
  def index
      @payment_methods = PaymentMethod.all 
  end

  def new
    @payment_method = PaymentMethod.new
  end

  def create
    @payment_method = PaymentMethod.new(payment_method_params)
    if @payment_method.save
      redirect_to payment_methods_path
    else
      render new_payment_method_path
    end
  end

  def edit;end

  def update
    if @payment_method.update(payment_method_params)
      redirect_to payment_methods_path
    else
      render new_payment_method_path
    end

  end

  def destroy
    if @payment_method.destroy
      redirect_to payment_methods_path
    end
  end

  # def show;end


  private

    def set_payment_method
      @payment_method = PaymentMethod.find(params[:id])
    end

    def payment_method_params
      params.require(:payment_method).permit(:payment_type, :discount, :active)
    end
  
end