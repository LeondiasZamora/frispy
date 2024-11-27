class FoodItemsController < ApplicationController
  before_action :setup_food_item, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    user_items = FoodItem.where(user_id: current_user)
    if params[:query].present?
      food_list = user_items.where("name ILIKE ?", "%#{params[:query]}%")
    else
      food_list = user_items
    end
    @food_items = food_list.sort_by(&:expiry_date)
  end

  def show
    @food_item = FoodItem.find(params[:id])
    # response = HTTP.get("https://api.example.com/food_items/1")
    # @food_item = response.parse(:json) # Parse API response into a hash
    # @image_url = @food_item["image_url"] # Assuming the API returns an 'image_url' key
    @food_items = current_user.food_items.order(expiry_date: :asc, created_at: :asc)
  end

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    @food_item.user = current_user
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
    params.require(:food_item).permit(:name, :quantity, :expiry_date)
  end
end
