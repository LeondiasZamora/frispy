class FoodItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_item, only: [:edit, :update, :destroy, :show]

  def index
    @food_items = FoodItem.all
  end

  def show
    @food_item = FoodItem.find(params[:id])
    # response = HTTP.get("https://api.example.com/food_items/1")
    # @food_item = response.parse(:json) # Parse API response into a hash
    # @image_url = @food_item["image_url"] # Assuming the API returns an 'image_url' key

    @food_items = current_user.food_items.order(expiry_date: :asc, created_at: :asc)
  end

  def new
    @food_item = current_user.food_items.new
  end

  def create
    @food_item = current_user.food_items.new(food_item_params)
    if @food_item.save
      redirect_to food_items_path, notice: "Food item added successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  

  def update
    if @food_item.update(food_item_params)
      redirect_to food_items_path, notice: "Food item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food_item.destroy
    redirect_to food_items_path, notice: "Food item deleted successfully."
  end

  private

  def set_food_item
    @food_item = current_user.food_items.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to food_items_path, alert: "Food item not found."
  end

  def food_item_params
    params.require(:food_item).permit(:name, :quantity, :expiry_date, :expected_lifetime, :nutry_score, images: [])
  end
end
