class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @ingredient = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      # flash[:notice] = 'Review was successfully created.'
      # flash[:notice] = 'Item was successfully created'
       redirect_to ingredients_path
     else
      # render 'new', error: "#{ @review.errors.full_messages.to_sentence }"
      # flash[:error] = "Item not created"
      render new_ingredient_path
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params) 
       redirect_to ingredients_path
    else
      render new_ingredient_path
    end
  end

  def destroy
    if @ingredient.destroy
       redirect_to ingredients_path
    end
  end

  def warning
    @ingredient = Ingredient.where("quantity <= 2 ")
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :detail_of_quantity)
    end

end
