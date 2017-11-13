class IngredientsController < ApplicationController
  before_action :set_ingredient!, only: [:edit, :show, :update]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient!
    @ingredient = Ingredient.find_by(params[:id])
  end
end