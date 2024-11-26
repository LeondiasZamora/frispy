class FoodItemsController < ApplicationController
  before_action :setup_food_item, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      food_list = FoodItem.where("name ILIKE ?", "%#{params[:query]}%")
    else
      food_list = FoodItem.all
    end
    @food_items = food_list.sort_by(&:expiry_date)
  end

  def show

  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def setup_food_item
    @food_item = FoodItem.find(params[:id])
  end

  def food_item_params
    params.require(:food_item).permit(:name, :quantity, :expiry_date, :expected_lifetime, :nutri_score, images: [])
  end
end
