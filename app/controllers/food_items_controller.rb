class FoodItemsController < ApplicationController

  def index
    @food_items = FoodItem.all
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
  end

  def edit
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:id])
  end

  def destroy
    @food_item = FoodItem.find(params[:id])
  end

  private

  def food_item_params
    params.require(:food_item).permit(:name, :quantity, :expiry_date, :expected_lifetime, :nutry_score, images: [])
  end
end
